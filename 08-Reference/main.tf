# Count Meta Parameter
resource "aws_instance" "b" { 
  ami = "ami-0dfcb1ef8550277af"
  instance_type = var.type_instance
  count = var.instance_count
  availability_zone = var.zones[count.index]
  tags = { 
      Name = "Lab-${var.env}-${count.index +1}"
      Project = "Terraform-Automation"
      Team    = "DevOps"
      Env     = var.env
   }
}



resource "aws_eip" "lb" {
  count = var.instance_count
  vpc = true
}

resource "aws_eip_association" "assoc_eip" {
  count = var.instance_count
  instance_id = aws_instance.b[count.index].id
  allocation_id = aws_eip.lb[count.index].id
}



