# resource "aws_security_group" "eks_sg" {
#   vpc_id      = var.vpc_id
#   name        = "eks-security-group"
#   description = "Security group for EKS cluster"

#   egress {
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#   }

#   ingress {
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 0
#     to_port     = 65535
#     protocol    = "tcp"
#   }
# }