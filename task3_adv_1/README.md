先用一套獨立的 Terraform 專案，以 local backend 執行，建立「給 Terraform 自己用的 S3 bucket」；
等 bucket 已經存在後，再讓主專案把 backend 設成 s3，把 state 存進這個 bucket。

```
terraform-s3-backend-demo/
├── bootstrap/
│   ├── provider.tf
│   ├── main.tf
│   └── outputs.tf
└── app/
    ├── backend.tf
    ├── provider.tf
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```