resource "aws_eip" "natgw_eip" {
  tags = {
    Name = "${local.vpc_name_lower}-natgw-eip"
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgw_eip.id
  subnet_id     = aws_subnet.public_subnets.0.id


  tags = {
    Name = "${local.vpc_name_lower}-natgw"
  }
  depends_on = [aws_internet_gateway.testvpc01]
}