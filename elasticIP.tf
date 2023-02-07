resource "aws_eip" "nat1" {

  depends_on = [
    aws_internet_gateway.mes-gateway
  ]

  tags = {
    Name = "mes-elastic-ip1"
  }

}

resource "aws_eip" "nat2" {

  depends_on = [
    aws_internet_gateway.mes-gateway
  ]

  tags = {
    Name = "mes-elastic-ip2"
  }

}
