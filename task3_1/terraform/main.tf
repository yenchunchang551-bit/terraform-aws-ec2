data "aws_caller_identity" "current" {}

# ================================
# 建立 AWS Key Pair
# ================================
# 將本機 public key 上傳到 AWS
# 讓 EC2 可以用這組 key 進行 SSH 登入
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# ================================
# 建立 Security Group（防火牆）
# ================================

resource "aws_security_group" "allow_ssh_http" {
  name = "allow_ssh_http"

  # 允許 SSH（port 22）
  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # 允許 HTTP（port 80）
  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 允許所有對外流量（必要）
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ================================
# 建立 EC2 Instance
# ================================
resource "aws_instance" "web" {

  # 作業系統
  ami = data.aws_ami.ubuntu.id

  # 機器規格
  instance_type = var.instance_type

  # 綁定剛剛建立的 key pair
  key_name = aws_key_pair.deployer.key_name

  # 套用 security group
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  # EC2 啟動時自動執行（安裝 nginx）
  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  # 標籤（AWS console 會看到）
  tags = {
    Name = "Yen Terraform EC2"
  }
}