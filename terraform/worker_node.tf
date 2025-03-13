
# resource "aws_eks_node_group" "node_group" {
#   cluster_name    = aws_eks_cluster.eks.name
#   node_group_name = "${var.name}-eks-node-group"
#   node_role_arn   = aws_iam_role.eks_cluster_role.arn
#   subnet_ids      = var.subnet_ids

#   scaling_config {
#     desired_size = var.scaling_config[desired_size]
#     max_size     = var.scaling_config[max_size]
#     min_size     = var.scaling_config[min_size]
#   }

#   instance_types = var.instance_types
#   capacity_type  = "ON_DEMAND"

#   remote_access {
#     ec2_ssh_key               = aws_key_pair.kp.key_name
#     source_security_group_ids = var.ssh_source_security_group_ids
#   }

#   tags      = var.tags
#   disk_size = var.disk_size
#   launch_template {
#     id      = aws_launch_template.eks_launch_template.id
#     version = "$Latest"
#   }
# }

# # Launch Template for Volume Encryption & Security Groups
# resource "aws_launch_template" "eks_launch_template" {
#   name_prefix = "${var.name}-launch-template"
#   block_device_mappings {
#     device_name = "/dev/xvda"

#     ebs {
#       volume_size           = var.disk_size
#       volume_type           = "gp3"
#       encrypted             = true
#       delete_on_termination = true
#     }
#   }

#   network_interfaces {
#     associate_public_ip_address = false
#     security_groups             = aws_security_group.eks_sg.id
#   }
# }