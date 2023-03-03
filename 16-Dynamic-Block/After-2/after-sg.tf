provider "aws" { 
  region = "us-east-1"
}

variable "sg_ports" { 
 type = list(number)
 description = "Allow Inbound Ports"
 default = [443,8200]
}

locals { 
  nsgrules = {
    ssh = {
      name = "SSH"
      to_port = "22"
      from_port = "22"
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0" ]
    }
   
   rdp = {
      name = "RDP"
      to_port = "9500"
      from_port = "9100"
      protocol  = "tcp"
      cidr_blocks = ["192.168.1.0/24"]
    }
   sql = {
      name = "mysql"
      to_port = "3306"
      from_port = "3306"
      protocol  = "tcp"
      cidr_blocks = ["192.168.64.0/24"]
    }
   
   }
 }



resource "aws_security_group" "demo-sg" { 
  name = "demo-tf-sg-test-1"
  description = "Allow Inbound Traffic to Multi Ports"

dynamic "egress" { 
  for_each = var.sg_ports
  content { 
   from_port = egress.value
   to_port   = egress.value
   protocol  = "tcp"
   cidr_blocks = ["192.168.64.0/24"]
  }

}


dynamic "ingress" { 
  for_each = local.nsgrules
  content { 
   from_port = ingress.value.from_port
   to_port   = ingress.value.to_port
   protocol  = "tcp"
   cidr_blocks = ingress.value.cidr_blocks
  }

}

  tags = { 
    Name = "Demo-tf-sg"
  }



}
