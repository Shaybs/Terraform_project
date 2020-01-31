variable "ami_id" {
	description = "AMI"
}

variable "pem-key" {
	description = "Associated key to SHH into the EC2"
	default = "MyKeyPair"
}

variable "associate_public_ip_address" {
	description = "true"
}

variable "public_subnet_id" {
	description = "subnet_id"
}

variable "private_subnet_id" {
	description = "subnet_id"
}

variable "vpc_security_group_ids" {
	description = "security groups"
}

variable "environment" {
	description = "Environment"
}

variable "region" {
	description = "region"
}