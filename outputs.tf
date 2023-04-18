output "vpc_id" {
   value = aws_vpc.testvpc01.id
   sensitive = false
}
output "vpc_arn" {
   value = aws_vpc.testvpc01.arn
   sensitive = false
}
output "aws_subnet" {
   value = aws_subnet.subnet1-public.id
   sensitive = false
}
