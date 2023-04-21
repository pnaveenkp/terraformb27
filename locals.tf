locals {
  bucket_name    = lower("${var.env}")
  vpc_name_lower = lower("${var.vpc_name}")
}
