#!/usr/bin/env bash

# Installing the mysql
yum install mysql-server mysql mariadb-server -y

# Starting the Mysql server
systemctl start mysqld
sudo service mariadb start

# Setting password to mysql-server
mysql -u root -e "SET PASSWORD FOR root@'%' = PASSWORD("${var.mysql_password}");"

# Creating the Database for wordpress
mysql -u root -p ${var.mysql_password} -e "CREATE DATABASE "${var.wordpress_database}";"

# Create user on mysql
mysql -u root -p ${var.mysql_password} -e  "CREATE USER "${var.wordpress-user}"@'%' IDENTIFIED BY "${var.wordpress_pass}";"

# Grant all privilages to the USER
mysql -u root -p ${var.mysql_password} -e  "GRANT ALL PRIVILEGES ON "${var.wordpress_database}".* TO "${var.wordpress-user}"@"%";"

# Flush all privilages
mysql -u root -p ${var.mysql_password} -e  "FLUSH PRIVILEGES;"
