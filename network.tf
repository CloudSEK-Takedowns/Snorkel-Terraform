#Create an Internet Gateway
resource "aws_internet_gateway" "snorkel-igw" {
    vpc_id = aws_vpc.snorkel-vpc.id
    tags = var.igw-tags
}

#Create public route table and associate IntegrnetGateway
resource "aws_route_table" "snorkel-public-crt" {
    vpc_id = aws_vpc.snorkel-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.snorkel-igw.id
    }
    
    tags = var.pub-sub-rt-tags
}

#Associate public subnet 1a to public Route table
resource "aws_route_table_association" "snorkel-crta-public-1a-subnet"{
    subnet_id = aws_subnet.snorkel-public-1a-subnet.id 
    route_table_id = aws_route_table.snorkel-public-crt.id
}

#Associate public subnet 1b to public Route table
resource "aws_route_table_association" "snorkel-crta-public-1b-subnet"{
    subnet_id = aws_subnet.snorkel-public-1b-subnet.id
    route_table_id = aws_route_table.snorkel-public-crt.id
}

# Allocate Elastic IP Address
resource "aws_eip" "eip-for-nat-gateway" {
  vpc    = true

  tags = var.nat-eip-tags
}

# Create Nat Gateway in Public Subnet 1a and associate eip
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.eip-for-nat-gateway.id
  subnet_id     = aws_subnet.snorkel-public-1a-subnet.id

  tags = var.nat-tags
}

# Create Private Route Table and Add Route Through Nat Gateway
resource "aws_route_table" "snorkel-private-crt" {
  vpc_id            = aws_vpc.snorkel-vpc.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat-gateway.id
  }

  tags = var.priv-sub-rt-tags
}

#Associate private subnet 1a to private route table
resource "aws_route_table_association" "snorkel-crta-private-1a-subnet"{
    subnet_id = aws_subnet.snorkel-private-1a-subnet.id
    route_table_id = aws_route_table.snorkel-private-crt.id
}

#Associate private subnet 1b to private route table
resource "aws_route_table_association" "snorkel-crta-private-1b-subnet"{
    subnet_id = aws_subnet.snorkel-private-1b-subnet.id
    route_table_id = aws_route_table.snorkel-private-crt.id
}

#Create Security group for Ec2
resource "aws_security_group" "snorkel-sg" {
    vpc_id = aws_vpc.snorkel-vpc.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.ip_16}"]
    }
      
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_1}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_2}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_3}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_4}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_5}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_6}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_7}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_8}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_9}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_10}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_11}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_12}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_13}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_14}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.ip_15}"]
    }
    tags = var.sg-tags
}
