terraform {
backend "s3" {
bucket = "student.09-rvv-bucket"
key = "student.09-network-state"
region = "eu-west-2"
}
}
