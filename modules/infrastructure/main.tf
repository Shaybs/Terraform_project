module "vpc" {
	source = "./vpc"

	environment = var.environment
	region = var.region
	public_subnet_id = module.subnets.public_subnet_id
}

module "ec2" {
	source = "./ec2"

	environment = var.environment
	region = var.region
	ami_id = var.ami_id
	public_subnet_id = module.subnets.public_subnet_id
	private_subnet_id = module.subnets.private_subnet_id
	vpc_security_group_ids = module.aws_sg.sg_id
	associate_public_ip_address = true
}

module "aws_sg" {
  source = "./securitygroups"
  name   = "SG"
  vpc_id = module.vpc.vpc_id
}

module "asg" {
  source = "./asg"
  environment = var.environment
  region = var.region
  ami_id = var.ami_id
  security_id = module.aws_sg.sg_id
  private_subnet_id = module.subnets.private_subnet_id
  recurrence_start = var.recurrence_start
  recurrence_stop = var.recurrence_stop
}

module "subnets" {
	source = "./subnets"

	environment = var.environment
	region = var.region
	vpc_id = module.vpc.vpc_id
}