resource "aws_eks_cluster" "eks" {
  name     = var.name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.eks_version
  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  # bootstrap_self_managed_addons = false

  # compute_config {
  #   enabled       = true
  #   node_pools    = ["general-purpose"]
  #   node_role_arn = aws_iam_role.node.arn
  # }

  # kubernetes_network_config {
  #   elastic_load_balancing {
  #     enabled = true
  #   }
  # }

  # storage_config {
  #   block_storage {
  #     enabled = true
  #   }
  # }

  vpc_config {
    subnet_ids = concat(var.private_subnet_ids, var.public_subnet_ids) #var.subnet_ids
  }
depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSComputePolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSBlockStoragePolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSLoadBalancingPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSNetworkingPolicy,
  ]

}

resource "aws_eks_access_entry" "example" {
  cluster_name      = aws_eks_cluster.eks.name
  principal_arn     = "arn:aws:iam::495599763524:user/anup_user"
  kubernetes_groups = ["master"]
  type              = "STANDARD"
}


resource "aws_eks_access_policy_association" "eks_policy_association" {
  cluster_name  = aws_eks_cluster.eks.name 
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = "arn:aws:iam::495599763524:user/anup_user"

  access_scope {
    type       = "cluster"
  }
}