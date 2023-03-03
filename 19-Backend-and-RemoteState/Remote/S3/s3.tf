provider "aws" { 
  region = "us-east-1"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "terraform-demo-av-03march2023"
  acl    = "private"

  versioning = {
    enabled = true
  }

}

