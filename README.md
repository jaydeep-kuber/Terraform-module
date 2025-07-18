# Terraform moduls

- here i am not going to explain much, module are reusable code templetes. 

## NOTE

- this is my dir structure. `infra` is the actual dir where you all infrastructire files are present.

```bash
    .
    ├── aws-dev-kp
    ├── aws-dev-kp.pub
    ├── infra
    │   ├── ec2.tf
    │   ├── outputs.tf
    │   ├── s3.tf
    │   └── variables.tf
    ├── install_nginx.sh
    ├── main.tf
    ├── providers.tf
    ├── README.md
    ├── terraform.tf
    ├── terraform.tfstate
    └── terraform.tfstate.backup
```

> one thing to make sure,

- you need to save `install_nginx.sh` in that directory in which you did `terraform init`.

- here `install_nginx.sh` is a **user data** file for aws EC it can be anyfile i have used nginx for demo.

> make sure your bucket name must me uniq in global. 

- you can do something like this

```python

    resource "aws_s3_bucket" "infra_bucket" {
      bucket = "dev-bucket-${random_id.suffix.hex}"
    }

    resource "random_id" "suffix" {
      byte_length = 4
    }
```

- it will give you names like `dev-bucket-20250718`
