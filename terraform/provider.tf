provider "aws" {
  region = "us-east-1"
#   profile = "personal"

  default_tags {
    tags = {
      Environment = "test"
      Team        = "globo"
      Project     = "globo"
      Owner       = "terraform"
    }
  }
}