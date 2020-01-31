#Create Launch Configuration
resource "aws_launch_configuration" "launch_configuration" {
	image_id = var.ami_id
	instance_type = "t2.micro"
	security_groups = var.security_id
	key_name = "MyKeyPair"
	lifecycle {
		create_before_destroy = true
	}
}

#Create Autoscaling Group
resource "aws_autoscaling_group" "autoscaling_group" {
	launch_configuration = aws_launch_configuration.launch_configuration.id
	min_size = 1
	max_size = 3
	tag {
		key = "Name"
		value = "Autoscaling Group"
		propagate_at_launch = true
	}
	 vpc_zone_identifier = [var.private_subnet_id]
}

resource "aws_autoscaling_schedule" "schedule_start" {
  scheduled_action_name  = "start"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  recurrence = var.recurrence_start
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}

resource "aws_autoscaling_schedule" "schedule_stop" {
  scheduled_action_name  = "start"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 1
  recurrence = var.recurrence_stop
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}