#!/bin/bash



sudo yum install $"{var.apps}" -y

echo "Wordpress user: $1, Wordpress pass: $2, Wordpress DATABASE: $3" >> /tmp/test.txt
