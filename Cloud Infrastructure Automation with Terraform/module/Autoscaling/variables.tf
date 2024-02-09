# Define a variable for the EC2 instance type (e.g., "t2.micro")
variable "instance_typ" {
  type = string
}

# Define a variable for the AWS region (e.g., "us-east-1")
variable "regions" {
  type = string
}

# Define a variable for the Amazon Machine Image (AMI) ID
variable "ami_id" {
  type = string
}

# Define a variable for the ARN (Amazon Resource Name) of the AWS Load Balancer Target Group
variable "aws_lb_target_group_arn" {
  type = string
}

# Define a variable for a list of subnet IDs for the Security Group
variable "subnet_ids" {
  description = "List of subnet IDs for the Security Group"
  type        = list(string)
}

# Define a variable for the Security Group ID
variable "security_group_id" {}

# Define a variable for the subnet ID of availability zone 1a
variable "subnet_id_1a" {
  # Add any specific configurations or descriptions if needed
}
