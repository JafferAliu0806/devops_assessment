variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "num_count" {
  default = 3
}

variable "ami" {
  default = "ami-094bbd9e922dc515d"
}

variable "s3_bucket" {
  default = "mytest-sg-assessment-04112022"
}


variable "min_server_count" {
  default = 3
}


variable "max_server_count" {
  default = 6
}

variable "desired_count" {
  default = 3
}

variable "instancetype" {
  default = "t2.micro"
}