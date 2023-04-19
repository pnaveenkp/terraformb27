# resource "aws_flow_log" "devopsb27flowlogs" {
#  log_destination      = aws_s3_bucket.nvpcflowlogsbucket.arn
#  log_destination_type = "s3"
#  traffic_type         = "ALL"
#  vpc_id               = aws_vpc.testvpc01.id
# }

