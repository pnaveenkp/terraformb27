# data "aws_vpc" "RRR" {
#   id = "vpc-0b919b0d2a3648e60"
# }
# data "aws_route_table" "AWS_Default-rt" {
#  route_table_id = "rtb-08a2132762d7b5fd5"
#  vpc_id         = data.aws_vpc.RRR.id
# }



# resource "aws_subnet" "default-subnet1-public" {
#   vpc_id            = data.aws_vpc.RRR.id
#   cidr_block        = "10.95.0.0/24"
#   availability_zone = "us-east-2a"
#   tags = {
#     Name = "AWSB27-Public-Subnet-4"
#   }
# }
# resource "aws_route_table_association" "default-subnet1-public" {
#  subnet_id      = aws_subnet.default-subnet1-public.id
#  route_table_id = data.aws_route_table.AWS_Default-rt.id
# }
