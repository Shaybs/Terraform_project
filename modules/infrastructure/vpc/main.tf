resource "aws_vpc" "vpc" {
	cidr_block = "10.0.0.0/16"
	enable_dns_support = true
	enable_dns_hostnames = true
	tags = {
		Name = "var.region-var.environment-vpc"
	}
}

resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.vpc.id
	tags = {
		Name = var.environment
	}
}

resource "aws_route_table" "rtb_public" {
	vpc_id = aws_vpc.vpc.id

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.igw.id
	}

	tags = {
	Name = var.environment
	}
}

resource "aws_route_table_association" "rta_subnet_public" {
	subnet_id = var.public_subnet_id
	route_table_id = aws_route_table.rtb_public.id
}