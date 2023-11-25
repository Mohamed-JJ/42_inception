FROM debian:11

RUN apt-get update -y && apt-get install openssl nginx -y 

RUN mkdir -p /var/run/nginx /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mjarboua.42.fr/UID=mjarboua"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx" , "-g","daemon off;"]