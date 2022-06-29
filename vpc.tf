provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_vpc" "test-VPC" {
    cidr_block = var.test-vpc
    enable_dns_support = true
    instance_tenancy = "default"
    tags = merge(
    local.owners_tags,
    {
      "Name" = "TestVPC"
    }
  )
  }

resource "aws_subnet" "Web-Tier-Subnet-AZ1a" {
  vpc_id = "${aws_vpc.test-VPC.id}"
  cidr_block = var.web-tiersubnet-az1a
  availability_zone = "us-east-1a"
  tags = merge(
  local.owners_tags,
  {
    "Name" = "Web-Tier-Subnet-AZ1a"
  }
  )
}

resource "aws_subnet" "Web-Tier-Subnet-AZ1b" {
  vpc_id = "${aws_vpc.test-VPC.id}"
  cidr_block  = var.web-tiersubnet-az1b
  availability_zone = "us-east-1b"
  tags = merge(
  local.owners_tags,
  {
    "Name" = "Web-Tier-Subnet-AZ1b"
  }
  )
}

resource "aws_subnet" "App-Tier-Subnet-AZ1a" {
    vpc_id = "${aws_vpc.test-VPC.id}"
    cidr_block = var.App-Tier-Subnet-Az1a
    availability_zone = "us-east-1a"
    tags = merge(
    local.owners_tags,
    {
      "Name" = "App-Tier-Subnet-AZ1a"
    }
    )
}

resource "aws_subnet" "App-Tier-Subnet-AZ1b" {
    vpc_id = "${aws_vpc.test-VPC.id}"
    cidr_block = var.App-Tier-Subnet-Az1b
    availability_zone = "us-east-1b"
    tags = merge(
    local.owners_tags,
    {
      "Name" = "App-Tier-Subnet-AZ1b"
    }
    )
}

resource "aws_subnet" "database-Tier-Subnet-AZ1a" {
    vpc_id = "${aws_vpc.test-VPC.id}"
    cidr_block = var.database-Tier-Subnet-Az1a
    availability_zone = "us-east-1a"
    tags = merge(
    local.owners_tags,
    {
      "Name" = "database-Tier-Subnet-AZ1a"
    }
    )
}
    resource "aws_subnet" "database-Tier-Subnet-AZ1b" {
        vpc_id = "${aws_vpc.test-VPC.id}"
        cidr_block = var.database-Tier-Subnet-Az1b
        availability_zone = "us-east-1b"
        tags = merge(
        local.owners_tags,
        {
          "Name" = "database-Tier-Subnet-AZ1b"
        }
        )
      }
