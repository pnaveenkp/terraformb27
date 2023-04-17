resource "aws_vpc" "testvpc01" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Owner       = "Rajasekhar"
    environment = var.env
  }
}


resource "aws_internet_gateway" "testvpc01" {
  vpc_id = aws_vpc.testvpc01.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}
