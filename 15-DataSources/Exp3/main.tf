provider "aws" { 
  region = "us-east-1"
}


data "aws_ami" "example" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

output "ami_details" { 
  value = data.aws_ami.example.image_id
}


resource "aws_instance" "demo" { 
  #ami = "ami-0dfcb1ef8550277af"
  ami = data.aws_ami.example.image_id
  instance_type = "t2.micro"

  tags = { 
      Name = "Lab-01"
      Project = "Terraform-Automation"
      Team    = "DevOps"
   }
}


data "template_file" "init" {
  template = "${file("${path.module}/init.tpl")}"

  vars = {
    private_address = "${aws_instance.demo.private_ip}"
    private_dns = "${aws_instance.demo.private_dns}"
   }
}


data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.sh")}"

  vars = {
    Docker_Version = "1.17"
    Ansible_Version = "3.0"
   }
}



output "tmp_file" { 
  value = data.template_file.init.rendered
}

output "userdata_file" { 
  value = data.template_file.userdata.rendered
}
