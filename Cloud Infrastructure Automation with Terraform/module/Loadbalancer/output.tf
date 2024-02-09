# Output the ARN (Amazon Resource Name) of the AWS Load Balancer Target Group
output "aws_lb_target_group_arn" {
  value = aws_lb_target_group.target_group_one.arn
}
