# --------------------------
# Variable Definitions
# --------------------------

# Define a variable for the AWS region.
variable "region" {}

# Define a variable for the project name.
variable "project_name" {}

# Define a variable for CIDR blocks, representing IP address ranges.
variable "cidr_blocks" {}

# Define a variable for the CIDR block of the public subnet in availability zone 1a.
variable "pub_sub_1a_cidr" {}

# Define a variable for the CIDR block of the public subnet in availability zone 1b.
variable "pub_sub_1b_cidr" {}

# Define a variable for the EC2 instance type.
variable "instance_typ" {}

# Define a variable for ingress CIDR blocks, which determine the source IP ranges for security group rules.
variable "ingress_cidr" {}

# Define a variable for a list of port values (numbers) used for dynamic ingress and egress rules.
variable "ports_values" {
  type = list(number)
}

# Define a variable for the protocol used in security group rules.
variable "protocol" {
  type = string
}

# Define a variable for a list of port values (numbers) used for Load Balancer ingress rules.
variable "ports_values_lb" {
  type = list(number)
}

# Define a variable for the protocol used in Load Balancer rules.
variable "lb_protcol" {
  type = string
}

# Define a variable for the Load Balancer port.
variable "lb_port" {
  type        = number
  description = "Load Balancer port"
  # Add any additional configurations if needed
}

# Define a variable for the Amazon Machine Image (AMI) ID.
variable "ami_id" {
  type = string
}
