resource "aws_vpc" "mes_vpc" {

  cidr_block = "192.168.0.0/16"

  instance_tenancy = "default"

  # Enable dns for our cluster
  enable_dns_support = true



  # Enable Dns hostname in vpc
  enable_dns_hostnames = true

  # enable_classiclink = false

  # enable_classiclink_dns_support = false

  assign_generated_ipv6_cidr_block = false

  tags = {
    Name                                                         = "mes-vpc"
    "kubernetes.io/cluster/aws_eks_cluster.mes-project.name" = "shared"
  }

}
