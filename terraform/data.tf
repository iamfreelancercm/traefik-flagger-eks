# Fetch the existing VPC by its ID or other criteria
data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}

# Fetch private subnets associated with the VPC
data "aws_subnet" "private_subnet_1" {
  id = var.subnet_ids[0]
}

data "aws_subnet" "private_subnet_2" {
  id = var.subnet_ids[1]
}

output "vpc_id" {
  value = data.aws_vpc.existing_vpc.id
}

output "private_subnet_1_id" {
  value = data.aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = data.aws_subnet.private_subnet_2.id
}

output "private_subnet_1_cidr" {
  value = data.aws_subnet.private_subnet_1.cidr_block
}

output "private_subnet_2_cidr" {
  value = data.aws_subnet.private_subnet_2.cidr_block
}