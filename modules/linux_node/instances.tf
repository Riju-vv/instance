
resource "aws_instance" "my_vm" {
count = "2"
ami = "ami-0fdf70ed5c34c5f52"
subnet_id = var.subnet_id
instance_type = "t3.micro"
key_name = var.key_name
vpc_security_group_ids = var.vpc_security_group_ids
tags = {
Name = "student.09-vm1"
}
}
