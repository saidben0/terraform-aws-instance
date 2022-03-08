output "aws_sben_amis" {
    value = data.aws_ami_ids.sben_amis.ids[0]
}