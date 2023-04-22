
locals {
 ingress = [80, 443, 22, 3389, 3306, 1433]
 egress  = [80, 443]
}
resource "aws_security_group" "with_dyn_blocks" {
 name        = "with_dyn_blocks"
 description = "with_dyn_blocks"
 vpc_id      = aws_vpc.testvpc01.id


 dynamic "ingress" {
   for_each = local.ingress
   content {
     from_port   = ingress.value
     to_port     = ingress.value
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
 }
 dynamic "egress" {
   for_each = local.egress
   content {
     from_port   = egress.value
     to_port     = egress.value
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
 }
}

# resource "aws_security_group" "allow_all" {
#  name        = "allow_all"
#  description = "Allow all inbound traffic"
#  vpc_id      = aws_vpc.testvpc01.id


#  ingress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }


#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
# }
# resource "aws_security_group" "testing_without_dyn_blocks" {
#  name        = "testing_without_dyn_blocks"
#  description = "testing_without_dyn_blocks"
#  vpc_id      = aws_vpc.testvpc01.id


#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "TCP"
#    cidr_blocks = ["10.1.1.100/32"]
#  }


#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
# }

# # resource "aws_security_group" "database_sg" {
# #   name        = "allowdatabase_sg_all"
# #   description = "Allow all inbound traffic for Database"
# #   vpc_id      = aws_vpc.testvpc01.id


# #   ingress {
# #     from_port   = 1433
# #     to_port     = 1433
# #     protocol    = "TCP"
# #     cidr_blocks = ["10.1.1.0/24"]
# #   }
# #   lifecycle {
# #     ignore_changes = [
# #       ingress,
# #     ]
# #   }

# # }
