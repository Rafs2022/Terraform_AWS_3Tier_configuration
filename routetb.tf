resource "aws_route_table" "routetb" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    "Name" = "Route"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main_public[count.index].id
  route_table_id = aws_route_table.routetb.id
  count          = 2
}


# Adding NAT Gateway into the default main route table

resource "aws_default_route_table" "defaultrt" {
  default_route_table_id = aws_vpc.main_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "defaultrt"
  }

}
