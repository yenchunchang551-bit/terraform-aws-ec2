resource "aws_security_group" "allow_ssh" {
  name        = "demo-allow-ssh"
  description = "Allow SSH"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "yen-terraform-s3-backend-demo"
  }
}