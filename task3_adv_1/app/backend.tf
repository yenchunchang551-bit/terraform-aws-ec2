terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket       = "yen-demo-tfstate-bucket-123456"
    key          = "dev/ec2-demo/terraform.tfstate"
    region       = "ap-northeast-1"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}