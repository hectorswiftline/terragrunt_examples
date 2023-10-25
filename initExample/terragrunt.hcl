// Location of the Terraform files

terraform {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git"
}

// Variables and region

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

// this is the variables on the terraform module
inputs = {
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  create_flow_log_cloudwatch_log_group = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}