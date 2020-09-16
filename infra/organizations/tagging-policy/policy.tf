provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_policy" "tagging_policy" {
  name        = "aws-haops-tags-policy"
  description = "enforcing tagging policy"

  type = "TAG_POLICY"

  content = <<CONTENT
    {
        "tags": {
            "costcenter": {
                "tag_key": {
                    "@@assign": "CostCenter"
                },
                "tag_value": {
                    "@@assign": [
                        "100",
                        "200"
                    ]
                },
                "enforced_for": {
                    "@@assign": [
                        "secretsmanager:*"
                    ]
                }
            }
        }
    }
    CONTENT
}

resource "aws_organizations_policy_attachment" "account_attach" {
  policy_id = aws_organizations_policy.tagging_policy.id
  target_id = var.target_account_id
}