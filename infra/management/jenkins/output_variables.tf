output "server_ip" {
  value = aws_instance.example.public_ip
}

output "eip" {
  value = aws_eip.example-ip.public_ip
}