# 指定使用 AWS provider
provider "aws" {
  # region 從 variables.tf 讀取
  region = var.aws_region
}