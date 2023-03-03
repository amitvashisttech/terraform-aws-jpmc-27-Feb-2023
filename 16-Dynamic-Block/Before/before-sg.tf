provider "aws" { 
  region = "us-east-1"
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

  ingress { 
   from_port = 443
   to_port   = 443
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { 
   from_port = 8200
   to_port   = 8200
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { 
   from_port = 8201
   to_port   = 8201
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }


  ingress { 
   from_port = 8210
   to_port   = 8210
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }



  ingress { 
   from_port = 8230
   to_port   = 8230
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { 
   from_port = 8240
   to_port   = 8240
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }


  ingress { 
   from_port = 9500
   to_port   = 9500
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }


  ingress { 
   from_port = 8500
   to_port   = 8600
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }


  tags = { 
    Name = "Demo-tf-sg"
  }



}
