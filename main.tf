terraform {
  backend "s3" {
    bucket = "halturi-terrafrom-state-backend"
    key    = "codebuild/test"
    region = "us-east-1"
  }
}

module "test_repo" {
  source = "./infra/ci-cd/aws"
}

output "clone_url" {
  value = module.test_repo.code_repo_url
}