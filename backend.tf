# // Backend S3 Bucket

resource "aws_s3_bucket" "backend-bucket" {
  bucket = var.be_bucket_name
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# // Dynamo db for statelock

# resource "aws_dynamodb_table" "state-lock-db" {
#   name         = var.dynamodb_name
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

