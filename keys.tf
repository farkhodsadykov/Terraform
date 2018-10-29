resource  "aws_key_pair" "project11" {
  key_name = "project11"
  public_key = "${file("/Users/fsadykov/.ssh/id_rsa.pub")}"
}
