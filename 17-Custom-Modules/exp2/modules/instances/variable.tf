variable "region" { 
  default = "us-east-1"
}

variable "ec2_count" { 
  default = "1"
}

variable "ec2_type" { 
  default = "t2.micro"

}
variable "owner" { 
  default = "Terraform" 
}

variable "project" {
  default = "Terraform Demo"
}

variable "name" { 
  default = "Demo-Ec2"
}

variable "env" { 
  default = "Dev"
}

