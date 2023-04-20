resource "aws_s3_bucket" "nvpcflowlogsbucket" {
  bucket = "devopsb27vpcflowlogsbucket${local.bucket_name}"


  tags = {
    Name = "devopsb27flowlogsbucket${local.bucket_name}"
  }
  lifecycle {
    create_before_destroy = true
  }
  #   depends_on = [
  #    aws_s3_bucket.ndevopsb27one
  #  ]

}

# resource "aws_s3_bucket" "ndevopsb27one" {
#   bucket = "naveendevopsb27one"


#   tags = {
#     Name = "Naveendevopsb27one"
#   }
#   depends_on = [
#    aws_s3_bucket.ndevopsb27two
#  ]

# }

# resource "aws_s3_bucket" "ndevopsb27two" {
#   bucket = "naveendevopsb27three"


#   tags = {
#     Name = "Naveendevopsb27three"
#   }


# }