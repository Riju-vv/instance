data "terraform_remote_state" "network_details" {
backend = "s3"
config = {
bucket = "student.09-rvv-bucket"
key = "student.09-network-state"
region = "eu-west-2"
}
}

resource "aws_instance" "my_vm" {
ami = "ami-0fdf70ed5c34c5f52"
subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
instance_type = "t3.micro"
key_name = data.terraform_remote_state.network_details.outputs.my_keyname
tags = {
Name = "student.09-vm1"
}
}
