provider "aws" { 
  region = "us-east-1"
}


data "aws_ami" "example" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

output "ami_details" { 
  value = data.aws_ami.example.image_id
}


resource "aws_instance" "demo" { 
  #ami = "ami-0dfcb1ef8550277af"
  ami = data.aws_ami.example.image_id
  instance_type = "t2.micro"

  tags = { 
      Name = "Lab-01"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}

