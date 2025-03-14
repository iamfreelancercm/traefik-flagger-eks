variable "region" {
  default = "eu-central-1"
}
# --- vpc ---
variable "vpc_id" {
  type    = string
  default = "vpc-027f7dc238db7de7e"
}
variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-0849867956604fe3c", "subnet-02a0ceed40d0b4f61"]
}

variable "name" {
  type    = string
  default = "tf-flagger"
}
variable "eks_version" {
  type    = string
  default = "1.32"
}


# --- Node Group ---
# variable "scaling_config" {
#   type = map(number)
#   default = {
#     desired_size = 1
#     max_size     = 1
#     min_size     = 1
#   }
# }
# variable "instance_types" {
#   type    = list(string)
#   default = ["t3.medium"]
# }
variable "tags" {
  type = map(string)
  default = {
    "name" = "eks-flagger"
    "type" = "flagger"
  }
}
# variable "disk_size" {
#   type    = number
#   default = 30
# }

variable "public_subnet_ids" {
    type = list(string)
}
variable "private_subnet_ids" {
    type = list(string)
}