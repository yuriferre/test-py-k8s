terraform {
  backend "s3" {
    bucket  = "tf-devops-test"
    key     = "state/globo.tfstate"
    region  = "us-east-1"
    encrypt = true
    profile        = "personal"
  }
}
