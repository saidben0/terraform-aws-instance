variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "cidr_block" {
    type = string
    default = "207.229.130.177/32"
}
variable "key_name" {
    type = string
    default = "sben_ec2_key"
}

variable "public_key" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeEHjErG2DpOVsRRHuX9KwT+11sG3TDtyOH8HvEphskLzyxs7U+N5i5q3gMNWwWtBfwdh2Q9a6YhmvXC2WX+emgTsqs9LtvJc3GJYrC0m/RPbqHa1cc5NfswZoS2ZZaIHy2BPUM7diY/ZysaErhps+06tJAAekpGaAXZcWsxwGPy1JuoNzgZJpRZu4xrei7rcfVgVCb3l2gQXwiODVPyIG0+M1XP2KLafjOSWmJ8ph36aI6KI//Ea7k+/FZaeANlCR3z0IA15OuXE1UbPVVcgXDJ98J+GyFZJeLf7escjBqcJL0hnKsOx0OBd32YRaE9h2hoI437o/JxfGv6P8QGxo6hR7i87NLOjiCzt5PLPBT91GJZW7qyVpnmQxl6jLp3qbFNbL0Z2tYPSW2tWfKuN4wxXYdeOVcJfVlDhWJ0DOC4a6qNrzu5cWFTltcEfNyLyGj2DMCVoPPd9XcUDIFxgRwcq+p0RA28iwdAewg9IWPpWxOjIcUaVJt0IL/QGy3Kc= saidben@SEA-1801242303"
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
  default = "sben_kms_key"
}

variable "account_id" {
  default = "155185327318"
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
  default ="arn:aws:iam::155185327318:user/kms_test"
}

variable "sben_user" {
  default = "arn:aws:sts::155185327318:assumed-role/Admin/saidben-Isengard"
}

variable "kms_alias" {
  default = "sben"
}
