resource "aws_internet_gateway" "mes-gateway" {
  vpc_id = aws_vpc.mes_vpc.id

  tags = {
    Name = "mes-gateway"
  }
}
