resource "aws_instance" "demo-ec2" { 
  ami = data.aws_ami.myami.id 
  instance_type = var.ec2_type
  count = var.ec2_count
 
 tags = local.some_tags
}
