# MES - Mongo Elastic S
resource "aws_iam_role" "mes-iam-role" {
  name = "mes-iam-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "mes-eks-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.mes-iam-role.name
}

### Create Cluster

resource "aws_eks_cluster" "mes-cluster" {

  name = "mes-cluster"

  role_arn = aws_iam_role.mes-iam-role.arn
  version  = "1.24"
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    security_group_ids = [aws_security_group.mes_security_group.id]

    subnet_ids = [
      aws_subnet.mes_subnet_public.id,
      aws_subnet.mes_subnet_private.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.mes-eks-cluster-policy
  ]
  tags = {
    Name = "mes-project"
  }
}
