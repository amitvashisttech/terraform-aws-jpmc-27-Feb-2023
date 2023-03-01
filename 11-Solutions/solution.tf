provider "aws" { 
region  = "us-east-1"
}


provider "aws" { 
region  = "us-east-1"
alias   = "us-west-1"
}

variable "zones_east" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "zones_west" {
  default = ["us-east-1c", "us-east-1d"]
}

variable "east_ami" { 
  default = "ami-006dcf34c09e50022"
}

variable "west_ami" { 
  default = "ami-006dcf34c09e50022"
}

variable  "instance_count" { 
  default = 2 
}


resource "aws_instance" "east_frontend" {
  ami           = var.east_ami
  instance_type = "t2.micro"
  availability_zone = var.zones_east[count.index]
  count             = var.instance_count
  depends_on    = [ aws_instance.east_backend ]
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "East-Frontend-${count.index +1}"
  }
}

resource "aws_instance" "west_frontend" {
  ami           = var.west_ami
  instance_type = "t2.micro"
  availability_zone = var.zones_west[count.index]
  count             = var.instance_count
  depends_on    = [ aws_instance.west_backend ]
  provider      = aws.us-west-1
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "West-Frontend-${count.index +1}"
  }
}


resource "aws_instance" "east_backend" {
  ami           = var.east_ami
  instance_type = "t2.micro"
  availability_zone = var.zones_east[count.index]
  count             = var.instance_count
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = "East-Backend-${count.index +1}"
  }
}


resource "aws_instance" "west_backend" {
  instance_type = "t2.micro"
  ami           = var.west_ami
  availability_zone = var.zones_west[count.index]
  count             = var.instance_count
  provider      = aws.us-west-1
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = "West-Backend-${count.index +1}"
  }
}

output "PublicIP_East_Frontend" {
  value = aws_instance.east_frontend.*.public_ip
}

output "PublicIP_East_Backend" {
  value = aws_instance.east_backend.*.public_ip
}

