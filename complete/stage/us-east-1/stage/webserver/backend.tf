# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "terragrunt-nimzo-terraform-state-admin-us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    key            = "stage/us-east-1/stage/webserver/terraform.tfstate"
    region         = "us-east-1"
  }
}