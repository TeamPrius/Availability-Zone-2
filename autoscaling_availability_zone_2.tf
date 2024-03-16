# create launch template and autoscaling group

# launch template
resource "aws_launch_template" "launch_template_availability_zone_2" {
  name          = local.launch_template_name
  image_id      = var.ami
  instance_type = var.instance_type

  block_device_mappings {
    device_name = # add ebs volume here

    ebs {
      volume_size = 5
    }
  }

  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.asg_security_group.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = local.launch_template_ec2_name
    }
  }

  user_data = filebase64("${path.module}/install-apache.sh") 
}


#  autoscaling group
resource "aws_autoscaling_group" "autoscaling_group_availability_zone_2" {
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_szie
  vpc_zone_identifier = ?
  target_group_arns   = ?

  launch_template {
    id      = aws_launch_template.launch_template_availability_zone_2.id
    version = aws_launch_template.launch_template_availability_zone_2.latest_version
  }
}