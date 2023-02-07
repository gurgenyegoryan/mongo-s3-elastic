resource "aws_eks_node_group" "mes-node-group-main" {

  cluster_name = aws_eks_cluster.mes-cluster.name

  node_group_name = "main-nodes"

  node_role_arn = aws_iam_role.mes-workers-nodes.arn

  launch_template {
    id = aws_launch_template.ssh_node.id
  }

  subnet_ids = [
    aws_subnet.mes_subnet_private.id,
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


  instance_types = ["t2.micro"]

  labels = {
    role = "mes-nodes"
    type = "main-instance"
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
