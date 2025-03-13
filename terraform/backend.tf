terraform {
  backend "s3" {
    bucket         = "terraform-metaplore"
    key            = "eks/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}
