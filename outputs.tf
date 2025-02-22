output "instance_public_ip" {
  description = "The public address of the EC2 Instance"
  value = aws_instance.nginx-webserver.public_ip
}

output "Instance-url" {
  description = "Instance url to access nginx server"
  value = "http://${aws_instance.nginx-webserver.public_ip}"
}
