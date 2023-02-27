# This is provider block
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "frontend" {
  ami           = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"

  tags = {
    Name    = "Lab-01"
    Project = "Terraform-Automation"
    Team    = "DevOps"
  }
}


/*
resource "aws_instance" "demo" { 
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"

  tags = { 
      Name = "Lab-01"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}
*/



resource "aws_instance" "backend" {
  ami           = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"

  tags = {
    Name    = "Lab-01"
    Project = "Terraform-Automation"
    Team    = "DevOps"
  }
}
