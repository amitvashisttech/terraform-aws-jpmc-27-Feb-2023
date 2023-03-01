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


variable "multi-region-deployment" { 
  default = true
}

variable "project-name" { 
  default = "Terraform-Demo"
}


variable "project-name-2" { 
  default = "Production-AV"
}

locals { 
   default_frontend_name = "${join("-", tolist([var.project-name, "East-Frontend"]))}"
   default_backend_name = "${join("-", tolist([var.project-name, "East-Backend"]))}"
   west_frontend_name = "${join("-", tolist([var.project-name-2, "West-Frontend"]))}"
   west_backend_name = "${join("-", tolist([var.project-name-2, "West-Backend"]))}"
} 

locals { 
  some_tags = {
      Owner = "DevOps Team"
      Project = "TF Demo Project"
      Name    = upper(local.west_frontend_name)
     }
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
    Name = local.default_frontend_name
  }
}

resource "aws_instance" "west_frontend" {
  ami           = var.west_ami
  instance_type = "t2.micro"
  availability_zone = var.zones_west[count.index]
  count             = var.multi-region-deployment ? var.instance_count : 0 
  depends_on    = [ aws_instance.west_backend ]
  provider      = aws.us-west-1
  lifecycle {
    create_before_destroy = true
  }
  tags = local.some_tags 
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
    Name = local.default_backend_name
  }
}


resource "aws_instance" "west_backend" {
  instance_type = "t2.micro"
  ami           = var.west_ami
  availability_zone = var.zones_west[count.index]
  count             = var.multi-region-deployment ? var.instance_count : 0 
  provider      = aws.us-west-1
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = local.west_backend_name
  }
}

output "PublicIP_East_Frontend" {
  value = aws_instance.east_frontend.*.public_ip
}

output "PublicIP_East_Backend" {
  value = aws_instance.east_backend.*.public_ip
}

