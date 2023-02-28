provider "aws" { 
  region = "us-east-1"
}


resource "aws_instance" "a" { 
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"

  tags = { 
      Name = "Frontend"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}



resource "aws_instance" "b" { 
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"

  tags = { 
      Name = "Backend"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}
