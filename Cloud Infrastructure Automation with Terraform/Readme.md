# Cloud Infrastructure Automation with Terraform

### *Description:*
This Terraform project orchestrates the deployment and configuration of a scalable and secure cloud infrastructure on AWS. The project includes modules for creating a Virtual Private Cloud (VPC), defining security groups, setting up a load balancer, and implementing auto-scaling configurations. Leveraging Terraform's infrastructure-as-code capabilities, this project streamlines the provisioning process, ensuring a reliable and efficient foundation for your applications. Customize parameters such as project name, CIDR blocks, and instance types to tailor the infrastructure to your specific requirements. Embrace automation and enhance the agility of your cloud deployment with this Terraform project.

### *project-root-directory/*
│
├── module/
│   ├── VPC/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── Security_groups/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── Loadbalancer/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── Autoscaling/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md

- project-root-directory: This is the main directory for your Terraform project.
- module/: Directory containing submodules for different components.
  *  VPC/: Module for creating the Virtual Private Cloud.
  *  Security_groups/: Module for managing security groups.
  *  Loadbalancer/: Module for setting up the load balancer.
  *  Autoscaling/: Module for configuring auto-scaling.
- main.tf: Main Terraform configuration file, where you instantiate and configure modules.

### *prerequisite:*
1. AWS Account with proper IAM roles.
2. Terraform softwares installed
3. Create AMI with HTTP package installed and index.html file.
4. One AWS S3 Bucket
5. One DynamoDB table for state locking.

- variables.tf: File containing input variables for the main configuration and modules.

- outputs.tf: File containing output values for the main configuration and modules.

- terraform.tfvars: File for storing variable values. (Should be kept secret and not committed to version control.)
