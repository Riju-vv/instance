variable region {
default = "eu-west-2"
}

variable profile {
default = "student.09"
}

variable instance_count {
default = "3"
}

variable "webserver_prefix" {
default = "student.09-webserver-vm"
}
variable "loadbalancer_prefix" {
default = "student.09-loadbalancer-vm"
}

variable "web_docker_host_prefix" {
default = "student.09-web_docker_host"
}
