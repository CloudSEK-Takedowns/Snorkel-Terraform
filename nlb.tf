#Allocate Elastic IP Address
resource "aws_eip" "eip-for-nlb" {
  vpc = true

  tags = var.nlb-eip-tags
}

#Create NLB 
resource "aws_lb" "network_load_balancer" {
  name = "cb-finance-ap-s1-snorkel-lb" 
  internal = false
  load_balancer_type = "network"
  subnet_mapping {
    subnet_id = aws_subnet.snorkel-public-1a-subnet.id
    allocation_id = aws_eip.eip-for-nlb.id
  }
  enable_deletion_protection = true
  enable_cross_zone_load_balancing = true
  tags = var.nlb-tags
}

#Create Target group
resource "aws_lb_target_group" "nlb_tg" {
  name     = "cb-finance-ap-s1-snorkel-tg"
  port     = "22"
  protocol = "TCP"
  vpc_id   = aws_vpc.snorkel-vpc.id
  health_check {
    interval            = 30
    port                = "traffic-port"
    protocol            = "TCP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
  tags = var.target-grp-tags
}

#NLB Listener
resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.network_load_balancer.arn
  port              = "22"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}

#Target group attachment
resource "aws_lb_target_group_attachment" "nlb_tg_attachment" {
  target_group_arn = aws_lb_target_group.nlb_tg.arn
  target_id        = aws_instance.snorkel-ec2-1.id   
  port             = 22
}
