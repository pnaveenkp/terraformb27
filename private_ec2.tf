resource "aws_instance" "private_servers" {
  # count                       = 3
  count = var.env == "Dev" ? 1 : 2
  ami                         = lookup(var.amis, var.region)
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.private_subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.with_dyn_blocks.id}"]
  associate_public_ip_address = false
  tags = {
    Name       = "${local.vpc_name_lower}-Server-${count.index + 1}"
    Env        = "Prod"
    Owner      = "Naveen"
    CostCenter = "ABCD"
  }

  user_data = <<-EOF
       #!/bin/bash
       sudo yum update
       sudo yum install -y nginx jq unzip
       echo "<h1>Deployed via Terraform and the server name is $${aws_instance.private_servers.*, count.index+1}-Server-1</h1>" | sudo tee /var/www/html/index.html
   EOF
depends_on = [
   aws_nat_gateway.natgw
 ]


}