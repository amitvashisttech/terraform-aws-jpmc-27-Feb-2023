provider "aws" { 
  region = "us-east-1"
}

resource "aws_instance" "b" { 
  # Amazon Linux
  ami = "ami-0dfcb1ef8550277af"


  # Ubuntu - 20.04
  #ami  = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  tags = { 
      Name = "Lab-01"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }

  lifecycle { 
    create_before_destroy = true
  }
}

