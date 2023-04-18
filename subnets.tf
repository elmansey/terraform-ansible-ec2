resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.master.id
  cidr_block = var.PUBLIC_SUBNET_1_CIDER_BLOCK
  availability_zone = var.AVAILABILITY_ZONE
  map_public_ip_on_launch=true
  tags = {
    Name = "public_subnet_1"
  }
}