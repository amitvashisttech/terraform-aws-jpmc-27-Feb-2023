variable "zones" { 
  default = [ "us-east-1a", "us-east-1b" ]
}



# Count Meta Parameter
resource "aws_instance" "b" { 
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  count = 2
  availability_zone = var.zones[count.index]
  tags = { 
      Name = "Lab-01"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}

