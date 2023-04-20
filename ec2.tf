resource "aws_instance" "web-1" {
  ami                         = var.imagename
  instance_type               = "t2.micro"
  key_name                    = "Naveenkey"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-Server-1"
    Env        = "Prod"
    Owner      = "Raja"
    CostCenter = "ABCD"
  }
  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes = [
      tags,
    ]
  }
   user_data = <<-EOF
       #!/bin/bash
       sudo apt-get update
       sudo apt-get install -y nginx jq unzip
       echo "<h1>Deployed via Terraform and the server name is ${local.vpc_name_lower}-Server-1</h1>" | sudo tee /var/www/html/index.html
   EOF

 }

