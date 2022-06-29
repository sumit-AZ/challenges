resource "aws_security_group" "app-server-sg" {
  name        = "Appserver-SG"
  description = "Allow inbound traffic from NLB"
  vpc_id      = ${aws_vpc.test-VPC.id}

  ingress {
    description     = "Allow traffic to app layer"
    from_port       = 80
    to_port         = 9000
    protocol        = "tcp"
    security_groups = [aws_security_group.webserver-sg.id]
  }

  egress {
    from_port   = 9000
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
  local.owners_tags,
  {
    "Name" = "webhost01"
  }
  )
}
