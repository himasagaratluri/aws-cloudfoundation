provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_policy" "tagging_policy" {
  name        = var.policy_name
  description = "enforcing tagging policy"

  type = "TAG_POLICY"

  content = file("${path.module}/policies/tag_policy.json")
}

resource "aws_organizations_policy_attachment" "account_attach" {
  policy_id = aws_organizations_policy.tagging_policy.id
  target_id = var.target_account_id
}