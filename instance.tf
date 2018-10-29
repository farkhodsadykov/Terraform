# Web Server
resource "aws_instance" "instance1" {
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
      "/tmp/apache.sh",
    ]
  }
  associate_public_ip_address = true
}

# DB Server
resource "aws_instance" "instance2" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name = "project11"
  subnet_id = "${aws_subnet.artemis-public.id}"
  vpc_security_group_ids = ["${aws_security_group.artemis.id}"]
  user_data = "${file("db_install.sh")}"
  associate_public_ip_address = true
}
