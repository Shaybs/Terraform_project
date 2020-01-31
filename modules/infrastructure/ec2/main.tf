resource "aws_instance" "public_instance" {
  ami = var.ami_id
  instance_type = "t2.micro"
  key_name = var.pem-key
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  lifecycle {
  create_before_destroy = true
  }

  tags = {
    Name = "${var.environment}-${var.region}-Public"
  }

  associate_public_ip_address = var.associate_public_ip_address

}

resource "aws_instance" "private_instance" {
  ami = var.ami_id
  instance_type = "t2.micro"
  key_name = var.pem-key
  subnet_id = var.private_subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  lifecycle {
  create_before_destroy = true
  }

  tags = {
    Name = "${var.environment}-${var.region}-Private"
  }

  associate_public_ip_address = var.associate_public_ip_address

}