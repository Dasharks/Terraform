# Set the AWS region to us-east-1.
region          = "us-east-1"

# Specify a project name for the Networking Infrastructure.
project_name    = "Networking_Infrastructure"

# Define the CIDR blocks for the two public subnets (1a and 1b).
pub_sub_1a_cidr = "10.0.1.0/24"
pub_sub_1b_cidr = "10.0.2.0/24"

# Define the overall CIDR block for the Virtual Private Cloud (VPC).
cidr_blocks     = "10.0.0.0/16"

# Set the instance type for the Autoscaling group instances to t2.micro.
instance_typ    = "t2.micro"

# Allow incoming traffic from any IP address (0.0.0.0/0).
ingress_cidr    = ["0.0.0.0/0"]

# Specify the list of ports to open for the Security Groups (22, 80, 443).
ports_values    = [22, 80, 443]

# Set the protocol for the Security Groups to TCP.
protocol        = "tcp"

# Specify the list of ports to open for the Load Balancer (22, 80).
ports_values_lb = [22, 80]

# Set the protocol for the Load Balancer to HTTP.
lb_protcol      = "HTTP"

# Set the Load Balancer port to 80.
lb_port         = 80

# Specify the Amazon Machine Image (AMI) ID for the instances.
ami_id          = "Please add your cousom-AMI Image ID"
