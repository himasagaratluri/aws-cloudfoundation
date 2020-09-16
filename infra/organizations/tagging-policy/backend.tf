terraform {
  backend "s3" {
    bucket = "halturi-terrafrom-state-backend"
    key    = "infra/organizations/tagging-policy/dev"
    region = "us-east-1"
  }
}