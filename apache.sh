#!/usr/bin/env bash

# Instaling the apache
yum install httpd php php-mysql -y

# Downloading the wordpress lates
wget https://wordpress.org/latest.tar.gz

# Extract the wordpress
tar -xzf latest.tar.gz

# Copy the wordpress example
cp wordpress/wp-config-sample.php wordpress/wp-config.php

# Adding the DataBase to the conffile
sed  "s|database_name_here|${var.wordpress_database}|g" -i wordpress/wp-config.php

# This line we adding the our user to wordpress
sed  "s|wordpress-user|${var.wordpress-user}|g" -i wordpress/wp-config.php

# Adding the password for our wordpress
sed  "s|your_strong_password|${var.wordpress_pass}|g" -i wordpress/wp-config.php

# Adding the mysql host to the wordpress
sed  "s|your_strong_password|${aws_instance.instance2.public_ip}|g" -i wordpress/wp-config.php
# Copy the wordpress data to httpd
cp -r wordpress/* /var/www/html/

# Creating the blod
mkdir /var/www/html/blog

# Copy everything to the wordpress folder
cp -r wordpress/* /var/www/html/blog/

# Create httpd Changes  /etc/httpd/conf/httpd.conf
sed  "s/None/All/g"  /etc/httpd/conf/httpd.conf

# Changing the owner ship
sudo chown -R apache /var/www

# Chaning the group owhen ship
sudo chgrp -R apache /var/www

# Giving the permission
sudo chmod 2775 /var/www

# Find all httpd data and give permission
find /var/www -type d -exec sudo chmod 2775 {} \;

# Disabling the seleniux
setenforce 0

# starting the httpd
systemctl start httpd

# Enable the httpd
systemctl enable httpd
