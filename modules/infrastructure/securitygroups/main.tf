resource "aws_security_group" "sg_22" {
	name = var.name
	description = "Allow SSH connection"
	vpc_id= var.vpc_id

	dynamic "ingress" {
	  iterator = port
	  for_each = var.ingress_ports
	  content {
	    from_port = port.value
	    protocol = "tcp"
	    to_port = port.value
	    cidr_blocks = var.open_internet
	  }
	}

	egress {
	  from_port = var.outbound-port
	  protocol = "-1"
	  to_port = var.outbound-port
	  cidr_blocks = var.open_internet
	}

}