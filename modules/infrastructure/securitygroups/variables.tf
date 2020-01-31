variable "ingress_ports" {
	type = list(number)
	description = "List of ingress ports"
	default = [22, 80, 443]
}

variable "name" {
	description = "Name"
	default = "sg_22"
}

variable "vpc_id" {
	description = "VPC ID"
}

variable "open_internet" {
	default = ["0.0.0.0/0"]
}

variable "outbound-port" {
	description = "outbound port"
	default = 0
}