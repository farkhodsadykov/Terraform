#!/usr/bin/env bash

# Installing the mysql
sudo yum install mysql-server mysql mariadb-server -y

# Starting the Mysql server
sudo systemctl start mysqld
sudo service mariadb start

# Setting password to mysql-server
mysqladmin -u root password redhat $4

# Creating the Database for wordpress
mysql -uroot -p$4 -e "CREATE DATABASE "$1";"

# Create user on mysql
mysql -uroot -p$4 -e "CREATE USER "$2"@'%' IDENTIFIED BY "$3";"

# Grant all privilages to the USER
mysql -uroot -p$4 -e "GRANT ALL PRIVILEGES ON "$1".* TO "$2"@"%";"

# Flush all privilages
mysql -uroot -p$4 -e  "FLUSH PRIVILEGES;"
