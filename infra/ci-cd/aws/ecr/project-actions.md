repo url:
719752468914.dkr.ecr.us-east-1.amazonaws.com/mydevservice

source code github repo:
1. terraform code for ECR creation.
2. .githubactions.yml

steps:
1. terraform init
2. terraform plan
3. terraform apply

requirements:
1. IAM user keys to authenticate to amazonaws
   User needs
   ecr:Create*
   ecr:Update*
   ecr:Delete*
   s3:* access to state bucket

   or use existing policy
