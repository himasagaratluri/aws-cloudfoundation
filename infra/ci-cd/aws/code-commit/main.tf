provider "aws" {
  region = "us-east-1"
}

resource "aws_codecommit_repository" "test" {
  repository_name = "MyTestRepository"
  description     = "This is the Sample App Repository"
}

output "code_repo_url" {
  value = aws_codecommit_repository.test.clone_url_http
}