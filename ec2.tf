resource "aws_instance" "web-1" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key
  subnet_id                   = data.terraform_remote_state.devopsb27-state.outputs.aws_subnet
  vpc_security_group_ids      = [data.terraform_remote_state.devopsb27-state.outputs.sg_id]
  associate_public_ip_address = true
  tags = {
    Name       = "Test-Server-1"
    Env        = "Prod"
    Owner      = "Raja"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
       #!/bin/bash
yum update -y
amazon-linux-extras install nginx1.12 -y
service nginx start
systemctl enable nginx
echo "<div><h1>$(cat/etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
echo "<div><h1>Naveen</h1></div>" >> /usr/share/nginx/html/index.html

   EOF


}

resource "aws_instance" "web-2" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key
  subnet_id                   = data.terraform_remote_state.devopsb27-state.outputs.vpc_subnet2
  vpc_security_group_ids      = [data.terraform_remote_state.devopsb27-state.outputs.sg_id]
  associate_public_ip_address = true
  tags = {
    Name       = "Test-Server-2"
    Env        = "Prod"
    Owner      = "Naveen"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
       #!/bin/bash
       yum update -y
amazon-linux-extras install nginx1.12 -y
service nginx start
systemctl enable nginx
echo "<div><h1>$(cat/etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
echo "<div><h1>Naveen</h1></div>" >> /usr/share/nginx/html/index.html
   EOF
}


resource "aws_instance" "web-3" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key
  subnet_id                   = data.terraform_remote_state.devopsb27-state.outputs.vpc_subnet3
  vpc_security_group_ids      = [data.terraform_remote_state.devopsb27-state.outputs.sg_id]
  associate_public_ip_address = true
  tags = {
    Name       = "Test-Server-3"
    Env        = "Prod"
    Owner      = "Raja"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
      yum update -y
amazon-linux-extras install nginx1.12 -y
service nginx start
systemctl enable nginx
echo "<div><h1>$(cat/etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
echo "<div><h1>Naveen</h1></div>" >> /usr/share/nginx/html/index.html
   EOF
}
