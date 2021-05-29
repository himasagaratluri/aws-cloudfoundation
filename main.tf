module "test_repo" {
  source = "./infra/ci-cd/aws"
}

output "clone_url" {
  value = module.test_repo.code_repo_url
}