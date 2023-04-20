terraform {
  backend "s3" {
    bucket         = "tfb27statefile"
    key            = "workspaces-terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "devopsb27-terraform-locking"
    encrypt        = true
  }
}


