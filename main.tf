data "terraform_remote_state" "network_details" {
backend = "s3"
config = {
bucket = "student.09-rvv-bucket"
key = "student.09-network-state"
region = var.region
}
}

module "webserver" {
source = "./modules/linux_node"
ami = "ami-0fdf70ed5c34c5f52"
instance_type = "t3.micro"
instance_count = "1"
key_name = data.terraform_remote_state.network_details.outputs.my_keyname
subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id_array
tags = {
Name = "student.09-webserver-vm"
}
}

module "loadbalancer" {
source = "./modules/linux_node"
ami = "ami-0fdf70ed5c34c5f52"
instance_type = "t3.micro"
instance_count = "0"
key_name = data.terraform_remote_state.network_details.outputs.my_keyname
subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id_array
tags = {
Name = "student.09-loadbalancer-vm"
}
}

