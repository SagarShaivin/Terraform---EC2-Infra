#Required Providers Installation

provider "aws" {
	region = "ap-south-1"
	access_key = "YourAccessKeyOfIAMuser"
	secret_key = "YourSecretKeyOfIAMuser"
}

# Calling security-group module to create a security group named "sec-grp-1"
module "security_grp1" {
  source = ".//security-grp"

  security_group_name = "sec-grp-1"
  vpc_id = module.vpc-1.vpc_id

  ingress_rules = [
	{
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = "0.0.0.0/0"
	},
	{
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = "0.0.0.0/0"
	}
  ]
  egress_rules = [
	{
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = "0.0.0.0/0"
	}
  ]
}

# Calling security-group module to create a security group named "sec-grp-2"
module "security_grp2" {
  source = ".//security-grp"

  security_group_name = "sec-grp-2"

  vpc_id = module.vpc-1.vpc_id

  ingress_rules = [
	{
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = "0.0.0.0/0"
	},
	{
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = "0.0.0.0/0"
	}
  ]
  egress_rules = [
	{
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = "0.0.0.0/0"
	}
  ]
}



#Calling VPC module to ceate VPC.
module "vpc-1" {
	source = ".//vpc"

	vpc_name = "VPC-1"
	vpc_cidr = "172.16.0.0/16"

	cidr_ip = ["172.16.0.0/24", "172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
	az_name = ["ap-south-1a", "ap-south-1b"]

	public_rt_cidr = "0.0.0.0/0"
	private_rt_cidr = "0.0.0.0/0"
}

#Calling ec2 module to create ec2 instances with other factors
module "ec2-1" {
  source = ".//ec2"

  ami_id = "ami-05e00961530ae1b55"
  instance_type_aws = "t2.micro"
  instance_count_aws = 1
  subnetid = module.vpc-1.public_subnet-1_id
  security_group_id = module.security_grp1.security_group_id
  pub_ip = ["true"]
}

#Calling ec2 module to create ec2 instances with other factors
module "ec2-2" {
  source = ".//ec2"

  ami_id = "ami-05e00961530ae1b55"
  instance_type_aws = "t2.micro"
  instance_count_aws = 1
  subnetid = module.vpc-1.private_subnet-1_id
  security_group_id = module.security_grp2.security_group_id
  pub_ip = ["false"]
}
