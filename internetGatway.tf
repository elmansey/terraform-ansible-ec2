resource "aws_internet_gateway" "master_gw" {
  vpc_id = aws_vpc.master.id
  tags = {
    Name = "master_gw"
  }
}