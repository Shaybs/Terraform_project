resource "aws_subnet" "public_subnet" {
	vpc_id = var.vpc_id
	cidr_block = "10.0.1.0/24"
	map_public_ip_on_launch = "true"

	tags = {
	Name = "${var.environment}-${var.region}-Public-Subnet"
	}
}


resource "aws_subnet" "private_subnet" {
	vpc_id = var.vpc_id
	cidr_block = "10.0.2.0/24"
	map_public_ip_on_launch = "true"

	tags = {
	Name = "${var.environment}-${var.region}-Private-Subnet"
	}
}