resource "aws_lb" "External-Loadbalancer" {
  name               = "ELB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webtier-sg.id]
  subnets            = [aws_subnet.Web-Tier-Subnet-AZ1b.id, aws_subnet.Web-Tier-Subnet-AZ1a.id]
  tags = local.owners_tags
  enable_deletion_protection = true
}
resource "aws_lb_target_group" "External-Loadbalancer-TG" {
  name     = "ELB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test-VPC.id
}

resource "aws_lb_target_group_attachment" "external-elb1" {
  target_group_arn = aws_lb_target_group.External-Loadbalancer-TG.arn
  target_id        = aws_instance.webhost01.id
  port             = 80

  depends_on = [
    aws_instance.webhost01,
  ]
}

resource "aws_lb_target_group_attachment" "external-elb2" {
  target_group_arn = aws_lb_target_group.External-Loadbalancer-TG.arn
  target_id        = aws_instance.webhost02.id
  port             = 80

  depends_on = [
    aws_instance.webhost02,
  ]
}

resource "aws_lb_listener" "External-ELB-Listener" {
  load_balancer_arn = aws_lb.External-Loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.External-Loadbalancer-TG.arn
  }
}
