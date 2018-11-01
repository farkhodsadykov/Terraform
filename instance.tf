# Web Server
resource "aws_instance" "web_server" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name = "project11"
  subnet_id = "${aws_subnet.artemis-public.id}"
  vpc_security_group_ids = ["${aws_security_group.artemis.id}"]
  provisioner "file" {
    source      = "apache.sh"
    destination = "/tmp/apache.sh"
    connection {
      user        = "ec2-user"
      private_key = "${file("/Users/fsadykov/.ssh/id_rsa")}"
    }
  }

  provisioner "remote-exec" {
    connection {
      user        = "ec2-user"
      private_key = "${file("/Users/fsadykov/.ssh/id_rsa")}"
    }
    inline = [
      "chmod +x /tmp/apache.sh",
      "sh /tmp/apache.sh ${var.m_data["wordpress_database"]} ${var.m_data["wordpress_user"]} ${var.m_data["wordpress_pass"]}  ${aws_instance.db_server.public_ip}" ,
    ]
  }
  associate_public_ip_address = true
}

# DB Server
resource "aws_instance" "db_server" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name = "project11"
  subnet_id = "${aws_subnet.artemis-public.id}"
  vpc_security_group_ids = ["${aws_security_group.artemis.id}"]
  provisioner "file" {
    source      = "db_install.sh"
    destination = "/tmp/db_install.sh"
    connection {
      user        = "ec2-user"
      private_key = "${file("/Users/fsadykov/.ssh/id_rsa")}"
    }
  }

  provisioner "remote-exec" {
    connection {
      user        = "ec2-user"
      private_key = "${file("/Users/fsadykov/.ssh/id_rsa")}"
    }
    inline = [
      "chmod +x /tmp/db_install.sh",
      "sh /tmp/db_install.sh ${var.m_data["wordpress_database"]} ${var.m_data["wordpress_user"]} ${var.m_data["wordpress_pass"]}  ${var.mysql_password}" ,
    ]
  }
  associate_public_ip_address = true
}
