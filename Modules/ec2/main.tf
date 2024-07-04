#Creating a resource "AWS_instance" for creating ec2 instances
resource "aws_instance" "AWS_instance" {
	ami = var.ami_id
	instance_type = var.instance_type_aws
	count = var.instance_count_aws
	subnet_id = var.subnetid
	vpc_security_group_ids = [var.security_group_id]
	associate_public_ip_address = element(var.pub_ip, count.index)
}

