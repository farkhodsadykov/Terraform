# This file will show the oputput for human read

# This line will show the IPaddress for our Web-Sever
output "Web-server" {
  value = "${aws_instance.instance1.public_ip}"
}

# This line will show the MYSQL sever's IP address
output "Mysql-server" {
  value = "${aws_instance.instance2.public_ip}"
}
