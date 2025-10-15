terraform {
  backend "s3" {
    bucket = "terraform-state-autoscaling-alerts"
    key    = "prod/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}