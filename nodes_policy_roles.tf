# Create IAM role for EKS Node Group
resource "aws_iam_role" "mes-workers-nodes" {

  name = "mes-workers-nodes"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "mes_eks_worker_nodes_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  role = aws_iam_role.mes-workers-nodes.name
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy_general" {

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"


  role = aws_iam_role.mes-workers-nodes.name
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_readonly" {

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"


  role = aws_iam_role.mes-workers-nodes.name
}