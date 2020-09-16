resource "aws_s3_bucket" "tagging_reports_bucket" {
  bucket = "aws-haops-tagging-reports"

  policy = file("${path.module}/policies/bucket_policy.json")

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.kms_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "s3_block_public_access" {
  bucket = aws_s3_bucket.tagging_reports_bucket.id

  block_public_acls   = true
  block_public_policy = true
}