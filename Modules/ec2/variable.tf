# Variable for mentioning which ami you want to use to create your instance
variable "ami_id" {
	type = string
}

# Variable for selecting type of ec2 instance as per our usecase
variable "instance_type_aws" {
	type = string
}

# Variable for creating number of ec2 instances we require
variable "instance_count_aws" {
	type = number
}

# Variable for selecting the subnet in which our ec2 instances will be created
variable "subnetid" {
    type = string
}

# Variable for storing the value of the security group which will be created in security-group module
variable "security_group_id" {
  type = string
}

#Variable for assigning public ip to ec2 instance
variable "pub_ip" {
  type = list(string)
}



