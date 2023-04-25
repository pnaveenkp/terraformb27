resource "aws_instance" "public-servers" { 
 count = var.environment == "Production" ? 3 : 1 
 ami                         = lookup(var.amis, var.aws_region)
 instance_type               = var.instance_type
 key_name                    = var.key_name
  iam_instance_profile = var.iam_instance_profile
 subnet_id                   = element(var.public_subnets, count.index)
 vpc_security_group_ids      = [var.sg_id]
 associate_public_ip_address = true
 tags = {
   Name       = "${var.vpc_name}-PublicServer-${count.index + 1}"
   Env        = var.environment   
 }
 user_data = <<-EOF
     #!/bin/bash
     sudo apt-get update
     sudo apt-get install -y nginx jq unzip
     sudo apt install git -y     
     echo "<h1>Deployed via Terraform and the server name is ${var.vpc_name}-Public-Server-${count.index + 1}</h1>" | sudo tee /var/www/html/index.html
 EOF
}
