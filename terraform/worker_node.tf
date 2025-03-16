
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.name}-eks-node-group"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.public_subnet_ids

  scaling_config {
    desired_size = var.scaling_config["desired_size"]
    max_size     = var.scaling_config["max_size"]
    min_size     = var.scaling_config["min_size"]
  }

  remote_access {
      ec2_ssh_key = aws_key_pair.kp.key_name
  }
  instance_types = var.instance_types
  capacity_type  = "ON_DEMAND"
  tags      = var.tags
}

