resource "aws_vpc" "master" {
  cidr_block       = var.VPC_CIDER
  enable_dns_hostnames=true
  tags = {
    Name = "master"
  }
}