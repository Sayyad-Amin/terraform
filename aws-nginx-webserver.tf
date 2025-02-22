resource "aws_instance" "nginx-webserver" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"

  subnet_id     = aws_subnet.public-subnet.id
  security_groups = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true

  user_data     = <<-EOF
       #!/bin/sh
       sudo apt update 
       sudo apt install nginx -y
       sudo apt install net-tools -y
       sudo systemctl start nginx
       EOF

  tags = {
    Name = "nginx-webserver"
  }

}
