provider "aws" {
  region = var.region
}

# create s3 bucket

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "terraform-sg-assessment-bucket-112233"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# create db for state file locks

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-task3-locks1"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
