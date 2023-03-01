provider "aws" { 
region  = "us-east-1"
}


provider "aws" { 
region  = "us-east-1"
alias   = "us-west-1"
}

/*
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
*/

# DataSources AZs
data "aws_availability_zones" "zones_east" {}
data "aws_availability_zones" "zones_west" {
  provider = aws.us-west-1
}


# DataSource for AMI

data "aws_ami" "east" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_ami" "west" {
  most_recent      = true
  owners           = ["amazon"]
  provider = aws.us-west-1

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
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
  ami           = data.aws_ami.east.id
  availability_zone = data.aws_availability_zones.zones_east.names[count.index]
  count             = var.instance_count
  instance_type = "t2.micro"
  depends_on    = [ aws_instance.east_backend ]
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = local.default_frontend_name
  }
}

resource "aws_instance" "west_frontend" {
  ami           = data.aws_ami.west.id
  availability_zone = data.aws_availability_zones.zones_west.names[count.index]
  instance_type = "t2.micro"
  count             = var.multi-region-deployment ? var.instance_count : 0 
  depends_on    = [ aws_instance.west_backend ]
  provider      = aws.us-west-1
  lifecycle {
    create_before_destroy = true
  }
  tags = local.some_tags 
}


resource "aws_instance" "east_backend" {
  ami           = data.aws_ami.east.id
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.zones_east.names[count.index]
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
  ami           = data.aws_ami.west.id
  availability_zone = data.aws_availability_zones.zones_west.names[count.index]
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

