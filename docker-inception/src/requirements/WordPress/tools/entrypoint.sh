#!/bin/sh
set -e

echo "wordpress initiated"

# Esperar a que MariaDB esté disponible
until mysqladmin ping \
  -h"$MYSQL_HOST" \
  -u"$MYSQL_USER" \
  -p"$MYSQL_PASSWORD" \
  --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done
echo "[+] Esperando a que MariaDB esté lista..."
until mysqladmin ping -h"$MYSQL_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
  echo "[+] MariaDB no lista, esperando 2s..."
  sleep 2
done

# Crear directorio de PHP-FPM
mkdir -p /run/php

# Copiar WordPress si no existe
if [ ! -f /var/www/html/index.php ]; then
    echo "Copying WordPress to /var/www/html"
    cp -a /tmp/wp/. /var/www/html/
fi

cd /var/www/html

# Instalar WordPress si no está instalado
if ! wp core is-installed --allow-root; then
    echo "Setting up wp-config.php and installing WordPress..."

    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$MYSQL_HOST" \
        --locale=es_ES \
        --allow-root

    wp core install \
        --url="https://$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    wp user create "$WP_USER" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --allow-root
else
    echo "WordPress already installed"
fi

# Permisos correctos
chown -R www-data:www-data /var/www/html

echo "Starting PHP-FPM..."
exec php-fpm -F