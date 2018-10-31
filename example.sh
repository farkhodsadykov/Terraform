#!/bin/bash



yum install $"{var.apps}" -y
echo "This ip server ${aws_instance.instance2.public_ip}" > /tmp/test.txt

echo "${var.wordpress-user}" >> /tmp/test.txt
