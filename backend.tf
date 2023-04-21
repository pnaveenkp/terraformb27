terraform {
  backend "s3" {
    bucket         = "tfb27statefile"
    key            = "functions-terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "devopsb27-terraform-locking"
    encrypt        = true
  }
}


