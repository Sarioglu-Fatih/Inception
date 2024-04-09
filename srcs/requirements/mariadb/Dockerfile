FROM debian:buster
RUN	apt-get update -y && apt-get upgrade -y
RUN	apt-get install mariadb-server procps -y
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
COPY ./conf/script.sh ./
RUN chmod +x script.sh
ENTRYPOINT [ "./script.sh" ]
