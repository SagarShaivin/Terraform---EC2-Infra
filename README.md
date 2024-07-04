# Terraform---EC2-Infra
Created an infrastructure of EC2 service using Terraform.

In this repository you will find the entire structure of EC2 instance (ec2, security group, vpc), each of them defined in their own module.
In each module, every service and their parameters and requirements are defined dynamically, hence you don't need to change any configurations in these modules, only when you want to define new parameters.
Since all parameters are dynamically defined, all these modules are working like child modules, each module of ec2, security group and vpc have their own (main.tf, variable.tf and output.tf) files.
At the end all these modules are called from the parent (main.tf) file.
In this parent (main.tf) file, you can change the configurations as per your requirements:

- You can create any number of ec2 instances as per your need
- You can assign different instance types to each of the instances dynamically.
- You can also create and assign different security groups as per your need to any of the instances.
- Here you can also choose how many VPCs you want to create, how many subnets should be there in each of the VPCs, and which of them will be public and private subnets.
- Finally, you can choose in whichever VPC you want your EC2 instance to be created, and also select whether it should be in a public or private subnet inside that particular VPC.
