FROM debian:bookworm
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        php-fpm \
        php-cli \
        php-mysql \
        php-curl \
        php-gd \
        php-mbstring \
        php-xml \
        php-zip \
        ca-certificates \
        wget \
        unzip \
        curl \
        mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/www && \
    curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www && \
    mv /var/www/wordpress /var/www/html && \
    rm /tmp/wordpress.tar.gz
RUN chown -R www-data:www-data /var/www/html
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000
WORKDIR /var/www/html

ENTRYPOINT ["/entrypoint.sh"]
