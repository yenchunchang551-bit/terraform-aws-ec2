# AWS 區域（例如東京、台北附近通常用 ap-northeast-1）
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "ap-northeast-1"
}

# EC2 instance 規格
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

# AMI（作業系統映像）
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0c3fd0f5d33134a76" # Amazon Linux 2 (Tokyo)
}

# 允許 SSH 連線的 IP（建議改成你自己的 IP）
variable "my_ip" {
  description = "IP address allowed to SSH into EC2"
  default     = "0.0.0.0/0" # ⚠️ demo 用，實務應限制自己 IP
}

# AWS key pair 名稱
variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "yen_terraform_ec2_key_pair"
}

# 本機 public key 路徑
variable "public_key_path" {
  description = "Path to local public key"
  default     = "~/.ssh/id_ed25519.pub"
}