resource "aws_vpc" "snorkel-vpc" {
    cidr_block = "${var.vpc-cidr}"
    enable_dns_hostnames = "true" 
    instance_tenancy = "default"    
    
    tags = var.vpc-tags
}
resource "aws_subnet" "snorkel-public-1a-subnet" {
    vpc_id = aws_vpc.snorkel-vpc.id
    cidr_block = "${var.public-subnet-1a-cidr}"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = var.az-1a
    tags = var.pub-sub-1a-tags
}
resource "aws_subnet" "snorkel-public-1b-subnet" {
    vpc_id = aws_vpc.snorkel-vpc.id
    cidr_block = "${var.public-subnet-1b-cidr}"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = var.az-1b
    tags = var.pub-sub-1b-tags
}
resource "aws_subnet" "snorkel-private-1a-subnet" {
    vpc_id = aws_vpc.snorkel-vpc.id
    cidr_block = "${var.private-subnet-1a-cidr}"
    map_public_ip_on_launch = "false" //it makes this a public subnet
    availability_zone = var.az-1a
    tags = var.priv-sub-1a-tags
}
resource "aws_subnet" "snorkel-private-1b-subnet" {
    vpc_id = aws_vpc.snorkel-vpc.id
    cidr_block = "${var.private-subnet-1b-cidr}"
    map_public_ip_on_launch = "false" //it makes this a public subnet
    availability_zone = var.az-1b
    tags = var.priv-sub-1b-tags
}

#EC2 Instance Creation
resource "aws_instance" "snorkel-ec2-1" {
    ami = "${var.AMI}"
    instance_type = "${var.instance_type}"
    associate_public_ip_address = false
    subnet_id = aws_subnet.snorkel-private-1a-subnet.id
    vpc_security_group_ids = ["${aws_security_group.snorkel-sg.id}"]

# the Public SSH key
    key_name = "${var.key_pair}"   #((need to create a key-pair and then add this))
    root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
    tags = var.instance-tags
}
