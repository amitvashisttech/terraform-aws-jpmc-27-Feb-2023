provider "aws" { 
  region = "us-east-1"
}

variable "sg_ports" { 
 type = list(number)
 description = "Allow Inbound Ports"
 default = [443,8200,8201,8202,8330,8081,9000,9200,9500,9510,9520]
}


resource "aws_security_group" "demo-sg" { 
  name = "demo-tf-sg-test-1"
  description = "Allow Inbound Traffic to Multi Ports"

  egress { 
   from_port = 443
   to_port   = 443
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }


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
  for_each = var.sg_ports
  content { 
   from_port = ingress.value
   to_port   = ingress.value
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }

}

  tags = { 
    Name = "Demo-tf-sg"
  }



}
