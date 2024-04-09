#!/bin/bash
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]
then

	service		mysql start
	mysql -e 	"CREATE DATABASE ${DB_NAME};"
	mysql -e	"CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PWD}';"
	mysql -e	"GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PWD}' WITH GRANT OPTION;"
	mysql -e	"FLUSH PRIVILEGES;"
	mysql -e	"ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_USER_PWD}';"
	service		mysql stop
fi

mysqld_safe

