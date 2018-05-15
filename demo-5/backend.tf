terraform {
  backend "s3" {
    bucket = "terraform-bucket-mumbai"
    key    = "terraform/demo-5"
    region = "ap-south-1"
  }
}
