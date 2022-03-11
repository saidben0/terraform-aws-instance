output "aws_sben_amis" {
    value = data.aws_ami_ids.sben_amis.ids[0]
}

output "nvme-to-block-template" {
  value = templatefile("${path.module}/nvme-to-block-mapping.sh", {
    devnames = join(" ", local.device_names)
  })
}

###################################################
####################### KMS #######################
###################################################

output "kms_key_id" {
  value = aws_kms_key.sben_kms_key.key_id
}
