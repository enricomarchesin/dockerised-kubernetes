provider "aws" {
  version = "~> 2.0"
  region  = var.stack.region
  profile = var.stack.profile
}
