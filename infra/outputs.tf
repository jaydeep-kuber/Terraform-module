output "ec2_ip" {
  value = aws_instance.infra_ec2[*].public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.infra_bucket.bucket
}