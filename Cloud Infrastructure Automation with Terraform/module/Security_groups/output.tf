# --------------------------
# Output Block
# --------------------------

# Define an output to expose the ID of the created AWS security group for public instances.
output "security_group_id" {
  value = aws_security_group.public_security_group.id
}

# Define an output to expose the ID of the created AWS security group for load balancer instances.
output "security_group_id_lb" {
  value = aws_security_group.lb_security_group.id
}
