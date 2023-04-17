resource "aws_subnet" "subnet1-public" {
  vpc_id            = aws_vpc.testvpc01.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "us-east-2a"


  tags = {
    Name = "${var.vpc_name}-subnet-1"
  }
}


resource "aws_subnet" "subnet2-public" {
  vpc_id            = aws_vpc.testvpc01.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "us-east-2b"


  tags = {
    Name = "${var.vpc_name}-subnet-2"
  }
}


resource "aws_subnet" "subnet3-public" {
  vpc_id            = aws_vpc.testvpc01.id
  cidr_block        = var.public_subnet3_cidr
  availability_zone = "us-east-2c"


  tags = {
    Name = "${var.vpc_name}-subnet-3"
  }
}
