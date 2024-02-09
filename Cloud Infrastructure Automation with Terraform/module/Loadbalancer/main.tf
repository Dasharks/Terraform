# Specify the AWS provider configuration with the desired region
provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

# Create an Application Load Balancer
resource "aws_lb" "application_lb" {
  name               = "tf-example-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.load_security_group  # Replace with your security group ID
  subnets            = var.subnet_ids   # Replace with your subnet IDs
  enable_deletion_protection = false
}

# Create a Target Group
resource "aws_lb_target_group" "target_group_one" {
  name     = "tf-example-lb-tg"
  port     = var.lb_port
  protocol = var.lb_protcol
  vpc_id   = var.alb_tg
}

# Associate Target Group with Application Load Balancer
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = 80
  protocol          = "HTTP"

  # Configure the default action to forward traffic to the Target Group
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_one.arn
  }
}
