resource "aws_vpc" "main" {
	cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "artemis-private" {
	vpc_id = "${aws_vpc.main.id}"
	cidr_block = "10.0.1.1/24"
}

resource "aws_subnet" "artemis-public" {
	vpc_id = "${aws_vpc.main.id}"
	cidr_block = "10.0.2.1/24"
}

resource "aws_internet_gateway" "artemis" {
	vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "artemis" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.artemis.id}"
  }
}

resource "aws_route_table_association" "artemis" {
	subnet_id = "${aws_subnet.artemis-public.id}"
	route_table_id = "${aws_route_table.artemis.id}"
}
