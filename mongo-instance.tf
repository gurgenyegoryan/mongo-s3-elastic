resource "aws_eks_node_group" "mes-node-group-mongo" {

  cluster_name = aws_eks_cluster.mes-cluster.name

  node_group_name = "mongo-nodes"

  node_role_arn = aws_iam_role.mes-workers-nodes.arn


  subnet_ids = [
    aws_subnet.mes_subnet_private.id
  ]


  scaling_config {

    max_size = 1
    desired_size = 1
    min_size = 1
  }
  

  ami_type = "AL2_x86_64"


  capacity_type = "ON_DEMAND"


  disk_size = 8


  force_update_version = false


  instance_types = ["m3.medium"]

  labels = {
    role = "mes-nodes"
    type = "mongo-instance"
  }

  # Kubernetes version
  version = "1.24"


  depends_on = [
    aws_iam_role_policy_attachment.mes_eks_worker_nodes_policy_general,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_readonly,
  ]

  tags = {
    Name = "mes-project-node"
  }

}
