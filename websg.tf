
resource "aws_security_group" "webtier-sg" {
 vpc_id = "${aws_vpc.test-VPC.id}"

# secure HTTPS access

 ingress {
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
     }
}
