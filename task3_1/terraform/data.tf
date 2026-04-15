data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical 官方

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
