resource "aws_eks_cluster" "eks" {
  name     = var.name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.eks_version
  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }
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

data "aws_caller_identity" "current" {}

resource "aws_eks_access_entry" "example" {
  cluster_name      = aws_eks_cluster.eks.name
  principal_arn     = data.aws_caller_identity.current.arn
  kubernetes_groups = ["master"]
  type              = "STANDARD"
}


resource "aws_eks_access_policy_association" "eks_policy_association" {
  cluster_name  = aws_eks_cluster.eks.name 
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = data.aws_caller_identity.current.arn

  access_scope {
    type       = "cluster"
  }
}