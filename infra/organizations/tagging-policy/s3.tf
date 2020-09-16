data "template_file" "s3_bucket_policy" {
  template = file("${path.module}/policies/bucket_policy.json.tpl")

  vars = {
    bucket_name = var.bucket_name
    org_id = var.org_id
  }
}

resource "aws_s3_bucket" "tagging_reports_bucket" {
  bucket = var.bucket_name

  policy = data.template_file.s3_bucket_policy.rendered

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "s3_block_public_access" {
  bucket = aws_s3_bucket.tagging_reports_bucket.id

  block_public_acls   = true
  block_public_policy = true
}