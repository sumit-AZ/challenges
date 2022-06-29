resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.test-VPC.id}"
  tags = merge(
  local.owners_tags,
  {
    "Name" = "igw-for-web"
  }
  )
}
