resource "aws_instance" "webhost01" {
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.Web-Tier-Subnet-AZ1a.id}"
   ami = var.ami_id
   user_data = "${file("data.sh")}"
   tags = merge(
   local.owners_tags,
   {
     "Name" = "webhost01"
   }
 )
 }

resource "aws_instance" "webhost02" {
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.Web-Tier-Subnet-AZ1b.id}"
   ami = var.ami_id
   user_data = "${file("data.sh")}"
   tags = merge(
    local.owners_tags,
    {
      "Name" = "webhost02"
    }
  )
}

resource "aws_instance" "apphost01" {
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.App-Tier-Subnet-AZ1a.id}"
   ami = var.ami_id
   tags = merge(
   local.owners_tags,
   {
    "Name" = "apphost01"
  }
  )
}

resource "aws_instance" "apphost02" {
  instance_type = var.instance_type
  subnet_id = "${aws_subnet.App-Tier-Subnet-AZ1b.id}"
   ami = var.ami_id
   tags = merge(
   local.owners_tags,
   {
    "Name" = "apphost01"
  }
  )
}

resource "aws_db_subnet_group" "multiazRDS" {
  subnet_ids = [aws_subnet.database-Tier-Subnet-AZ1a.id, aws_subnet.database-Tier-Subnet-AZ1b.id]
  tags = merge(
  local.owners_tags,
  {
    "Name" = "RDS-SubnetG"
  }
  )
}
resource "aws_db_instance" "Backend-DB" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.multiazRDS.id
  engine                 = "mysql"
  engine_version         = ""
  instance_class         = "db.t2.micro"
  multi_az               = true
  db_name                = "TestDB"
  username               = ""
  password               = ""
  skip_final_snapshot    = "true"
  tags = merge(
  local.owners_tags,
 {
    "Name" = "Backend-DB"
  }
  )
}
