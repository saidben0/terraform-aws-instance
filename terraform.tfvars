instance_type = "t3.micro"
cidr_block = "<cidr-block>/32"
key_name = "sben_ec2_key"
public_key = "<public_key>"
availability_zone = "us-east-1a"

ebs_volumes = {
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

