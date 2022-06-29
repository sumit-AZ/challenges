# CIDR Block for VPC
variable "test-vpc" {
  default = "10.0.0.0/16"
}

# CIDR Block for webtier, apptier, database tier Subnet
  variable "web-tiersubnet-az1a" {
    default = "10.0.1.0/24"
  }
  variable "web-tiersubnet-az1b" {
    default = "10.0.2.0/24"
  }
  variable "App-Tier-Subnet-Az1a" {
    default = "10.0.3.0/24"
  }
variable "App-Tier-Subnet-Az1b" {
  default = "10.0.4.0/24"
}
variable "database-Tier-Subnet-Az1a" {
  default = "10.0.6.0/24"
}
variable "database-Tier-Subnet-Az1b" {
  default = "10.0.7.0/25"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "ami_id" {
  default = "ami-0cff7528ff583bf9a"
}
