resource "aws_kms_key" "kms_key" {
  description             = "This key is used to encrypt the reports bucket"
  deletion_window_in_days = 10

  policy = file("${path.module}/policies/kms_policy.json")
}

resource "aws_kms_alias" "kms_key_alias" {
  name          = "alias/haops/tagging-reports-kms"
  target_key_id = aws_kms_key.kms_key.key_id
}
