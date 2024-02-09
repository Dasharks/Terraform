# Define an AWS Launch Template
resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = var.ami_id
  instance_type = var.instance_typ
  
  # Configure the network interface settings for the launch template
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [var.security_group_id]
    subnet_id = var.subnet_id_1a
  }
  
  # Provide user data for the launched instances using base64 encoding
  user_data = base64encode(
    <<-EOF
      #!/bin/bash
      systemctl start httpd
      systemctl enable httpd
    EOF
  )
}

# Create a new AWS Autoscaling Group
resource "aws_autoscaling_group" "bar" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier = var.subnet_ids  # Replace with your subnet ID(s)

  # Associate the launch template with the autoscaling group
  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }

  health_check_type          = "EC2"
  health_check_grace_period  = 300
  force_delete               = true
  wait_for_capacity_timeout  = "0"

  # Define tags for instances launched by the autoscaling group
  tag {
    key                 = "Name"
    value               = "example-instance"
    propagate_at_launch = true
  }
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  lb_target_group_arn    = var.aws_lb_target_group_arn
}

# Create an AWS Placement Group
resource "aws_placement_group" "test" {
  name     = "test"
  strategy = "cluster"
}
