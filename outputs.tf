
output "vpc_id" {
  value = data.terraform_remote_state.devopsb27-state.outputs.vpc_id
}
output "sg_id" {
  value = data.terraform_remote_state.devopsb27-state.outputs.sg_id
}
output "vpc_subnet1_id" {
  value = data.terraform_remote_state.devopsb27-state.outputs.aws_subnet
}
output "vpc_subnet2_id" {
  value = data.terraform_remote_state.devopsb27-state.outputs.vpc_subnet2
}
output "vpc_subnet3_id" {
  value = data.terraform_remote_state.devopsb27-state.outputs.vpc_subnet3
}
