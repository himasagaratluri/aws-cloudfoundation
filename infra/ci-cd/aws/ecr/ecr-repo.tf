provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "github-actions-repo" {
  name                 = "mydevservice"
  image_tag_mutability = "MUTABLE"
}

output "github-actions-repo-url" {
  value = aws_ecr_repository.github-actions-repo.repository_url
}