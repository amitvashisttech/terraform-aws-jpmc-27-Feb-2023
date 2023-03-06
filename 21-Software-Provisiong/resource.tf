resource "aws_instance" "dev-app" {
  ami = data.aws_ami.myami.id
  instance_type = lookup(var.instance_type, terraform.workspace)
  count = lookup(var.instance_count, terraform.workspace)
  key_name = var.key_name
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = local.default_name
  }

 connection { 
     type = "ssh"
     user = "ec2-user"
     private_key = file(var.pvt_key)
     host   = self.public_ip
 }

 provisioner "file" { 
    source = "./frontend"
    destination = "frontend"
 }


 provisioner "remote-exec" { 
    inline = [
      "sudo chmod +x ~/frontend/run_frontend.sh",
      "sudo sh ~/frontend/run_frontend.sh",

    ]
  }
 

}
