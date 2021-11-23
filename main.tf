data "terraform_remote_state" "network_details" {
backend = "s3"
config = {
bucket = "student.09-rvv-bucket"
key = "student.09-network-state"
region = "eu-west-2"
}
}
