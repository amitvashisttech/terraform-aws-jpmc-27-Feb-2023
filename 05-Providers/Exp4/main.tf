resource "aws_instance" "a" { 
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"

  tags = { 
      Name = "Lab-01"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}



resource "aws_instance" "b" { 
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"

  tags = { 
      Name = "Lab-01"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}



resource "aws_instance" "c" { 
  provider = aws.backup-region
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"

  tags = { 
      Name = "Lab-01"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}
