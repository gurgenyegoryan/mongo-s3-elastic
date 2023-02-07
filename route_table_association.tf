resource "aws_route_table_association" "mes-public" {

  subnet_id = aws_subnet.mes_subnet_public.id

  route_table_id = aws_route_table.mes-public-route.id

}

resource "aws_route_table_association" "mes-private" {

  subnet_id = aws_subnet.mes_subnet_private.id

  route_table_id = aws_route_table.mes-private-route.id


}
