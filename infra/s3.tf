resource "aws_s3_bucket" "infra_bucket" {
 
  bucket = var.bucket_name

  tags = {
    Environment = var.env
    Name        = var.bucket_name
  }
}