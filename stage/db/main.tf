terraform {
  backend "s3" {
    bucket         = "terraform-nimzo"
    key            = "stage/db/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-lock-table"
  }
}
