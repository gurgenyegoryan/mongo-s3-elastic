resource "aws_subnet" "mes_subnet_public" {
  vpc_id = aws_vpc.mes_vpc.id

  cidr_block = "192.168.0.0/18"

  availability_zone = "eu-west-1a"

  map_public_ip_on_launch = true


  tags = {
    Name                                    = "mes_subnet_public-eu-west-1a"
    "kubernetes.io/cluster/mes-project" = "shared"
    "kubernetes.io/role/elb"                = 1

  }
}


resource "aws_subnet" "mes_subnet_private" {
  vpc_id = aws_vpc.mes_vpc.id

  cidr_block = "192.168.64.0/18"	

  availability_zone = "eu-west-1b"

  map_public_ip_on_launch = false

  tags = {
    Name                                    = "mes_subnet_private-eu-west-1a"
    "kubernetes.io/cluster/mes-project" = "shared"
    "kubernetes.io/role/internal-elb"       = 1
  }
}
