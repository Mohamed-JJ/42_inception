FROM	debian:11

RUN apt update -y && apt upgrade -y && apt-get install  mariadb-server -y


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/startup.sh /startup.sh

RUN chmod +x /startup.sh


CMD [ "/startup.sh" ]
