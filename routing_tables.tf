resource "aws_route_table" "mes-public-route" {

  vpc_id = aws_vpc.mes_vpc.id
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mes-gateway.id

  }

  tags = {
    Name = "mes-public-route"
  }
}

resource "aws_route_table" "mes-private-route" {

  vpc_id = aws_vpc.mes_vpc.id
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gateway1.id
  }

  tags = {
    Name = "mes-private1-route"
  }
}