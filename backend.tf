terraform {
  backend "s3" {
    bucket  = "terraform-state-jorgegdoliveira"
    key     = "auth-service/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}