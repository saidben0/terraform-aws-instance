resource "aws_kms_key" "sben_kms_key" {
  description         = "My KMS Keys for Data Encryption"
  customer_master_key_spec = var.key_spec
  is_enabled               = var.enabled
  enable_key_rotation      = var.rotation_enabled  
  policy = templatefile("${path.module}/kms_policy.json.tpl", {
      account_id = "${var.account_id}"
  })
  #policy = "${data.template_file.kms_policy.rendered}"

  tags = {
    Name = "sben_kms_key"
  }
}

resource "aws_kms_alias" "sben_kms_alias" {
  name          = "alias/${var.kms_key_name}"
  target_key_id = "${aws_kms_key.sben_kms_key.key_id}"
}