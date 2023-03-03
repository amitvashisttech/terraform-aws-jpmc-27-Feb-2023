terraform {
  backend "s3" {
    bucket = "terraform-demo-av-03march2023"
    key    = "terraform01/terraform.tfstate"
    region = "us-east-1"
  }
}
