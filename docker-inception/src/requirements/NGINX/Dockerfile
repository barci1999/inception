FROM debian:bookworm
RUN apt update && apt install -y nginx openssl
COPY nginx.conf /etc/nginx/nginx.conf
COPY temp_cert /etc/ssl
CMD ["nginx","-g","daemon off;"]