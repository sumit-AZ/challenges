esource "aws_lb" "network-Loadbalancer" {
  name               = "NLB"
  load_balancer_type = "Network"
  security_groups    = [aws_security_group.app-server-sg.id]
  subnets            = [aws_subnet.App-Tier-Subnet-AZ1b.id, aws_subnet.App-Tier-Subnet-AZ1a.id]
  tags = local.owners_tags
  enable_deletion_protection = true
}
resource "aws_lb_target_group" "Network-Loadbalancer-TG" {
  name     = "ELB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test-VPC.id
}

resource "aws_lb_target_group_attachment" "Network-elb1" {
  target_group_arn = aws_lb_target_group.Network-Loadbalancer-TG.arn
  target_id        = aws_instance.apphost01.id
  port             = 80

  depends_on = [
    aws_instance.apphost01,
  ]
}

resource "aws_lb_target_group_attachment" "external-elb2" {
  target_group_arn = aws_lb_target_group.Network-Loadbalancer-TG.arn
  target_id        = aws_instance.apphost01.id
  port             = 80

  depends_on = [
    aws_instance.apphost02,
  ]
}

resource "aws_lb_listener" "NLB-Listener" {
  load_balancer_arn = aws_lb.network-Loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Network-Loadbalancer-TG.arn
  }
}
