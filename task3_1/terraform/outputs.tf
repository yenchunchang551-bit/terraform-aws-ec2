# EC2 公網 IP
output "public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web.public_ip
}

# SSH 指令（直接複製用）
output "ssh_command" {
  value = "ssh ubuntu@${aws_instance.web.public_ip}"
}

output "current_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "current_arn" {
  value = data.aws_caller_identity.current.arn
}