include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/app"
}

inputs = {
  aws_region       = "ap-northeast-1"
  project_name     = "task3-adv-1"
  environment      = "prod"
  ami_id           = "ami-0f310fced6141e627"
  instance_type    = "t3.small"
  key_name         = "yen_key_pair"
  allowed_ssh_cidr = "0.0.0.0/0"
}