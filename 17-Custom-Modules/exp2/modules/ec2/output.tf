output "publicip" { 
 value = aws_instance.demo-ec2.*.public_ip
}



output "privateip" { 
 value = aws_instance.demo-ec2.*.private_ip
}
