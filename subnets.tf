# creating public subnets
resource "aws_subnet" "public_subnets" {
  # count             = 3
  count             = length(var.public_subnet_cidr_blocks)
  vpc_id            = aws_vpc.testvpc01.id
  cidr_block        = element(var.public_subnet_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)


  tags = {
    Name  = "${local.vpc_name_lower}-publicsubnet-${count.index + 1}"
    Owner = "Naveen"

  }
}

# creating private subnets
resource "aws_subnet" "private_subnets" {
  # count             = 3
  count             = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.testvpc01.id
  cidr_block        = element(var.private_subnet_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)



  tags = {
    Name  = "${local.vpc_name_lower}-privatesubnet-${count.index + 1}"
    Owner = "Naveen"

  }
}
