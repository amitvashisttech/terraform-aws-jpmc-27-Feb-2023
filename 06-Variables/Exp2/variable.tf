variable "zones" { 
  default = [ "us-east-1a", "us-east-1b" ]
}

variable "type_instance" { 
  type = string 
  default = "t2.micro"
}

variable "instance_count" {
  default = "1"
}

variable "env" { 
  default = "dev"
}

variable "region" { 
  default = "us-east-1"
}

