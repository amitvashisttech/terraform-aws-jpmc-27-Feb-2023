resource "aws_instance" "dev-app" {
  ami = data.aws_ami.myami.id
  instance_type = lookup(var.instance_type, terraform.workspace)
  key_name = var.key_name
  availability_zone = var.zone
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = local.default_name
  }
}

resource "aws_ebs_volume" "my-vol" { 
  availability_zone = var.zone
  size = 40

  tags = { 
    Name = "my-ebs-vol"
  }

}

resource "aws_volume_attachment" "ebs_att" { 
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.my-vol.id
  instance_id = aws_instance.dev-app.id
}

