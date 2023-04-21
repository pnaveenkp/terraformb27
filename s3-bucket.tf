# resource "aws_s3_bucket" "nvpcflowlogsbucket" {
#   bucket = "devopsb27vpcflowlogsbucket${local.bucket_name}"


#   tags = {
#     Name = "devopsb27flowlogsbucket${local.bucket_name}"
#   }
#   lifecycle {
#     create_before_destroy = true
#   }
#   #   depends_on = [
#   #    aws_s3_bucket.ndevopsb27one
#   #  ]

# }