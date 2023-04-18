resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.master.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.master_gw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}