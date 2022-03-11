variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "cidr_block" {
    type = string
    default = "<cidr-block>/32"
}
variable "key_name" {
    type = string
    default = "<key_name>"
}

variable "public_key" {
    type = string
    default = "<public_key>"
}

variable "availability_zone" {
    type = string
    default = "us-east-1a"
}

variable "ebs_volumes" {
  type = map(object({
    device_name = string
    volume_size = number
    volume_type = string
  }))
  default = {
    data01 = {
      device_name = "/dev/xvde"
      volume_size        = "8"
      volume_type        = "gp3"
    }
    data02 = {
      device_name = "/dev/xvdf"
      volume_size        = "9"
      volume_type        = "gp3"
    }
  }
}
locals {
  device_names = ([ for key, value in var.ebs_volumes: value.device_name ])
}

###########################################################
################### KMS ###################################
###########################################################

variable "kms_key_name" {
  default = "<kms_key>"
}

variable "account_id" {
  default = "<account_id>"
}

variable "key_spec" {
  default = "SYMMETRIC_DEFAULT"
}

variable "enabled" {
  default = true
}

variable "rotation_enabled" {
  default = true
}

variable "user_arn" {
  default ="arn:aws:iam::${account_id}:user/kms_test"
}

variable "sben_user" {
  default = "arn:aws:sts::${account_id}:assumed-role/Admin/<username>"
}

variable "kms_alias" {
  default = "alias"
}
