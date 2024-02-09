# Define a variable for the list of security group IDs associated with the load balancer
variable "load_security_group" {
  type = list(string)
}

# Define a variable for the VPC ID where the application load balancer target group resides
variable "alb_tg" {
  type = string
}

# Define a variable for the protocol used by the load balancer (e.g., "HTTP")
variable "lb_protcol" {
  type = string
}

# Define a variable for the port used by the load balancer (e.g., 80)
variable "lb_port" {
  type = number
}

# Define a variable for a list of subnet IDs where the load balancer is deployed
variable "subnet_ids" {
  description = "List of subnet IDs for Load Balancer"
  type        = list(string)
}
