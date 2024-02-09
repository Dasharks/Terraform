# Cloud Infrastructure Automation with Terraform

### **NOTE: In this project, we have not included the .gitignore file. Therefore, some files such as .tfvars, .tfstate, etc., are restricted from being pushed to GitHub. Please exercise caution and refrain from including the following files in your GitHub repository.**

### *Description:*
This Terraform project orchestrates the deployment and configuration of a scalable and secure cloud infrastructure on AWS. The project includes modules for creating a Virtual Private Cloud (VPC), defining security groups, setting up a load balancer, and implementing auto-scaling configurations. Leveraging Terraform's infrastructure-as-code capabilities, this project streamlines the provisioning process, ensuring a reliable and efficient foundation for your applications. Customize parameters such as project name, CIDR blocks, and instance types to tailor the infrastructure to your specific requirements. Embrace automation and enhance the agility of your cloud deployment with this Terraform project.

   ![image](https://github.com/Dasharks/Terraform/assets/159520477/9ae14e9b-4c6d-4a96-ad5d-8ef63e4a58b7)


### *project-root-directory/*
```
project-root-directory/
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

```

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

### *How to create AMI ?* 
- Create an EC2 instance with any AMI. Either Login to the server and install the HTTPD package or install the package using user data while creating the server
```
#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "autoscaling" >/var/www/html/index.html
```
- Confirm HTTP is installed properly.
- Now Select your EC2 instance
- Under **Actions**  Click on **Image and Templates** under that click on **Create Images**
![Screenshot 2024-02-09 204059](https://github.com/Dasharks/Terraform/assets/159520477/e1668f35-7bc6-4037-9767-322761736032)
- Add name and description
![Screenshot 2024-02-09 204322](https://github.com/Dasharks/Terraform/assets/159520477/543a9115-e7d6-4cf7-bd92-3f09389a0c27)
- Click on Create Image.
- Now custom AMI is created.

### *How to create DynamoDB table*

- Search for DynamoDB in AWS console and open DynamoDB.
- Click on Create a table
- Add Table name
- Partition key must be **String** and it should be **LockID**
![Screenshot 2024-02-09 204850](https://github.com/Dasharks/Terraform/assets/159520477/feb395f8-189c-49f5-8982-d383684c4f5d)
- Click on Create Table.

### *.gitignore file contents*
```

/**/*.tfstate*
/**/.terraform

../modules/key/client_key
../modules/key/client_key.pub
# Local .terraform directories
**/.terraform/*
.terraform/*
*.hcl
*.lock*
../.terraform/*
terraform.*
*.tfvars*

# .tfstate files
*.tfstate
/**/*.tfstate*
*.tfstate.*
```
