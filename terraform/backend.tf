terraform {
  backend "s3" {
    bucket  = "terraform-metaplore"
    #key     = "eks/flagger-eks-terraform.tfstate"
    key     = "eks/new-flagger-eks-terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}
