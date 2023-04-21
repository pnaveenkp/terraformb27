resource "aws_instance" "private_servers" {
  count                       = 3
  ami                         = var.imagename
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.private_subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = false
  tags = {
    Name       = "${local.vpc_name_lower}-Server-${count.index + 1}"
    Env        = "Prod"
    Owner      = "Naveen"
    CostCenter = "ABCD"
  }

  user_data = <<-EOF
       #!/bin/bash
       sudo apt-get update
       sudo apt-get install -y nginx jq unzip
       echo "<h1>Deployed via Terraform and the server name is $${aws_instance.private_servers.*, count.index+1}-Server-1</h1>" | sudo tee /var/www/html/index.html
   EOF

}