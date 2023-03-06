data "aws_ami" "myami" {
  most_recent = true
  owners  = ["528646462716"]

  filter {
    name = "name"
    values = ["apache-ami-packer*"]
  }
}

locals { 
  default_name = "${join("-", tolist([terraform.workspace, "example"]))}"
}


variable "region" {
  default = "us-east-1"
}


variable "instance_type" { 
  type = map
  default = { 
      default = "t2.nano"
      dev     = "t2.micro"
      prod    = "t2.micro"
      mindtree = "x1.large"
  }

}



variable "instance_count" { 
  type = map
  default = { 
      default = "1"
      dev     = "2"
      prod    = "5"
      mindtree = "7"
  }

}

variable "key_name" { 
  default = "terraform-key-27-Feb-2023"
}

variable "pvt_key" { 
  default = "/root/.ssh/amitvashist-terraform.pem"
}

variable "sg_id" {
  default = "sg-03a98777c184aed2a"
}

