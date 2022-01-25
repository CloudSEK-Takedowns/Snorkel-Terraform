#EC2 Instance related details
instance_type = "t3.medium"

AMI = "ami-0af25d0df86db00c1"

root_device_type = "gp2"

root_device_size = "50"

key_pair = "cb-dev-snorkel-key-pair"

instance-tags = {
  Name = "cb-dev-ap-s1-private-snorkel-1a-server"
}


#VPC and SUBNETS related details
AWS_REGION = "ap-south-1"

az-1a = "ap-south-1a"

az-1b = "ap-south-1b"

vpc-tags = {
    Name = "cb-dev-ap-s1-snorkel-vpc"
}

pub-sub-1a-tags = {
  Name = "cb-dev-ap-s1-public-1a-subnet"
}

pub-sub-1b-tags = {
  Name = "cb-dev-ap-s1-public-1b-subnet"
}

priv-sub-1a-tags = {
  Name = "cb-dev-ap-s1-private-1a-subnet"
}

priv-sub-1b-tags = {
  Name = "cb-dev-ap-s1-private-1b-subnet"
}

pub-sub-rt-tags = {
  Name = "cb-dev-ap-s1-public-routetable"
}

priv-sub-rt-tags = {
  Name = "cb-dev-ap-s1-1a-private-routetable"
}

#securitygroup
sg-tags = {
  Name = "cb-dev-ap-s1-snorkel-sg"
}

#nlb, Nat, Igw related details
igw-tags = {
  Name = "cb-dev-ap-s1-igw"
}

nat-eip-tags = {
  Name = "cb-dev-ap-s1-nat-eip"
}

nlb-eip-tags = {
  Name = "cb-dev-ap-s1-nlb-eip"
}

nat-tags = {
  Name = "cb-dev-ap-s1-1a-nat-gw"
}

nlb-tags = {
  Name = "cb-dev-ap-s1-snorkel-lb"
}

target-grp-tags = {
  Name = "cb-dev-ap-s1-snorkel-tg"
}