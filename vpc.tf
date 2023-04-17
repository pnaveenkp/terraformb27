resource "aws_vpc" "testvpc01" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name        = "terraform_testvpc_1"
    Owner       = "Naveen"
    environment = var.env
  }

}

resource "aws_internet_gateway" "testvpc01" {
  vpc_id = aws_vpc.testvpc01.id
  tags = {
    Name = "${var.IGW_name}-IGW"
  }
}

