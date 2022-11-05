terraform {
  backend "s3" {
    bucket         = "terraform-sg-assessment-bucket-112233"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-task3-locks1"
    encrypt        = true
  }
}
