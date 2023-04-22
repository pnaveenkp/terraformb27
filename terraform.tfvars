vpc_name                   = "Naveen-function"
cidr_block                 = "10.95.0.0/16"
env                        = "DEV"
public_subnet_cidr_blocks  = ["10.95.1.0/24", "10.95.2.0/24", "10.95.3.0/24", "10.95.4.0/24"]
private_subnet_cidr_blocks = ["10.95.10.0/24", "10.95.20.0/24", "10.95.30.0/24", "10.95.40.0/24"]
azs                        = ["us-east-2a", "us-east-2b" ]
# imagename                  = "ami-0a695f0d95cefc163"
key_name                   = "Naveenkey"
instance_type = "t2.nano"
region        = "us-east-2"
amis = {
    "us-east-2" = "ami-06c4532923d4ba1ec"
    "us-west-2" = "ami-0b0f111b5dcb2800f"
    
    }

