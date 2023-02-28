output "public_ips" {
  value = aws_instance.b.*.public_ip 
}

output "public_dns" {
  value = aws_instance.b.*.public_dns
}


output "private_ip_n_dns" { 
  value = "${tolist([aws_instance.b.*.private_ip, aws_instance.b.*.private_dns])}"
}
