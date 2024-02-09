# --------------------------
# Module Instances
# --------------------------

# Instantiate the VPC module to create a Virtual Private Cloud (VPC).
module "vpc_mod" {
  source          = "../module/VPC"
  project_name    = var.project_name
  pub_sub_1a_cidr = var.pub_sub_1a_cidr
  pub_sub_1b_cidr = var.pub_sub_1b_cidr
  cidr_blocks     = var.cidr_blocks
}

# Instantiate the Security Groups module to create necessary security groups.
module "Securityy_mod" {
  source          = "../module/Security_groups"
  vpc_id          = module.vpc_mod.vpc_id
  subnet_id       = module.vpc_mod.subnet_id_1a
  ports_values    = var.ports_values
  ports_values_lb = var.ports_values_lb
  ingress_cidr    = var.ingress_cidr
  protocol        = var.protocol
}

# Instantiate the Load Balancer module to create a load balancer.
module "Loadbalancer_module" {
  source = "../module/Loadbalancer"
  load_security_group = [module.Securityy_mod.security_group_id_lb]
  lb_protcol          = var.lb_protcol
  alb_tg              = module.vpc_mod.vpc_id
  lb_port             = var.lb_port
  subnet_ids          = [module.vpc_mod.subnet_id_1a, module.vpc_mod.subnet_id_1b]
}

# Instantiate the Autoscaling module to manage auto-scaling configurations.
module "autoscalings" {
  source                  = "../module/Autoscaling"
  instance_typ            = var.instance_typ
  regions                 = var.region
  aws_lb_target_group_arn = module.Loadbalancer_module.aws_lb_target_group_arn
  ami_id                  = var.ami_id
  subnet_ids              = [module.vpc_mod.subnet_id_1a]
  security_group_id       = module.Securityy_mod.security_group_id
  subnet_id_1a            = module.vpc_mod.subnet_id_1a
}
