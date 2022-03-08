output "aws_sben_amis" {
    value = data.aws_ami_ids.sben_amis.ids[0]
}

output "nvme-to-block-template" {
  value = templatefile("${path.module}/nvme-to-block-mapping.sh", {
    devnames = join(" ", local.device_names)
  })
}