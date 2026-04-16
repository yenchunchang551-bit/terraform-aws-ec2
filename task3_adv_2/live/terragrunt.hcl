remote_state {
  backend = "s3"

  config = {
    bucket         = "yen-demo-tfstate-bucket-123456"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
    use_lockfile   = true
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}