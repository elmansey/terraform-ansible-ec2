terraform {
    backend "s3" {
      bucket  = "terraform00remote00state"
      dynamodb_table = "locking_state"
      key     = "terraform.tfstate"
      region  = "us-east-1"
    }
}