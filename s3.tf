resource "aws_s3_bucket" "web-hosting-bucket" {
  bucket = var.bucket_name
}
