variable "AWS_REGION" { 
    description = "AWS region"
    type = string
}

variable "az-1a" {
    description = "Availability zone 1a"
    type = string
}

variable "az-1b" {
    description = "Availability zone 1a"
    type = string
}

#VPC and SUBNETS related variabls
variable "vpc-tags" {
    type = object({
     Name = string
    })
}
variable "pub-sub-1a-tags" {
    type = object({
     Name = string
    })
}
variable "pub-sub-1b-tags" {
    type = object({
     Name = string
    })
}
variable "priv-sub-1a-tags" {
    type = object({
     Name = string
    })
}
variable "priv-sub-1b-tags" {
    type = object({
     Name = string
    })
}
variable "pub-sub-rt-tags" {
    type = object({
     Name = string
    })
}
variable "priv-sub-rt-tags" {
    type = object({
     Name = string
    })
}

variable "vpc-cidr" {
    default = "172.29.0.0/16"
    description = "VPC CIDR block"
    type = string
}

variable "public-subnet-1a-cidr" {
    default = "172.29.2.0/24"
    description = "Public Subnet 1a CIDR block"
    type = string
}
variable "public-subnet-1b-cidr" {
    default = "172.29.4.0/24"
    description = "Public Subnet 1b CIDR block"
    type = string
}
variable "private-subnet-1a-cidr" {
    default = "172.29.3.0/24"
    description = "Private Subnet 1a CIDR block"
    type = string
}
variable "private-subnet-1b-cidr" {
    default = "172.29.5.0/24"
    description = "Private Subnet 1b CIDR block"
    type = string
}

#security group ingress traffic
variable "sg-tags" {
    type = object({
     Name = string
    })
}

variable "ip_1" {
    default = "175.100.160.142/32"
    description = "BCP"
    type = string
}
variable "ip_2" {
    default = "175.100.160.207/32"
    description = "stpbrk.corporate.hdfcbank.com"
    type = string
}
variable "ip_3" {
    default = "175.100.160.32/32"
    description = "stpfcc.uat.enetbanking.hdfcbank.com"
    type = string
}
variable "ip_4" {
    default = "175.100.160.30/32"
    description = "stpbrk.uat.corporate.hdfcbank.com"
    type = string
}
variable "ip_5" {
    default = "175.100.160.25/32"
    description = "stpfcc.uat.enetbanking.hdfcbank.com"
    type = string
}
variable "ip_6" {
    default = "175.100.163.231/32"
    description = "s2suat.hdfcbank.com"
    type = string
}
variable "ip_7" {
    default = "175.100.162.143/32"
    description = "BCP"
    type = string
}
variable "ip_8" {
    default = "175.100.163.54/32"
    description = "ECMS"
    type = string
}
variable "ip_9" {
    default = "175.100.162.139/32"
    description = "BCP"
    type = string
}
variable "ip_10" {
    default = "175.100.163.205/32"
    description = "ECMS"
    type = string
}
variable "ip_11" {
    default = "175.100.162.166/32"
    description = "BCP"
    type = string
}
variable "ip_12" {
    default = "175.100.160.205/32"
    description = "stpfcc.enetbanking.hdfcbank.com"
    type = string
}
variable "ip_13" {
    default = "175.100.160.251/32"
    description = "BCP"
    type = string
}
variable "ip_14" {
    default = "175.100.160.208/32"
    description = "stpenet.corporate.hdfcbank.com"
    type = string
}
variable "ip_15" {
    default = "175.100.160.19/32"
    description = "stpenet.uat.corporate.hdfcbank.com"
    type = string
}
variable "ip_16" {
    default = "0.0.0.0/0"
    description = "sftp"
    type = string
}

#EC2 Instance related variables

variable "instance-tags" {
    type = object({
     Name = string
    })
}

#Ec2 AMI
variable "AMI" {
    description = "ID of the AMI used"
    type = string
}

#EC2 Instance type
variable "instance_type" {
    description = "instance-type"
    type = string
}

#Ec2 root volume
variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
}
 
variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
}

variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
}

#NetworkLoadBalancer, Nat, Igw related variables
variable "igw-tags" {
    type = object({
     Name = string
    })
}

variable "nat-eip-tags" {
    type = object({
     Name = string
    })
}

variable "nlb-eip-tags" {
    type = object({
     Name = string
    })
}

variable "nat-tags" {
    type = object({
     Name = string
    })
}

variable "nlb-tags" {
    type = object({
     Name = string
    })
}

variable "target-grp-tags" {
    type = object({
     Name = string
    })
}