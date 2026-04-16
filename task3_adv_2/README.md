# task3_adv_1 - Terragrunt Example

This project demonstrates how to use Terragrunt to manage multiple Terraform environments with a shared S3 remote state backend.

## Project Structure

```text
task3_adv_1/
├── modules/
│   └── app/
│       ├── data.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       └── variables.tf
├── live/
│   ├── terragrunt.hcl
│   ├── dev/
│   │   └── app/
│   │       └── terragrunt.hcl
│   └── prod/
│       └── app/
│           └── terragrunt.hcl
└── README.md