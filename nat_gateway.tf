resource "aws_nat_gateway" "gateway1" {

  allocation_id = aws_eip.nat1.id

  subnet_id = aws_subnet.mes_subnet_public.id

  tags = {
    Name = "mes-Nat1"
  }
}
