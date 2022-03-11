data "aws_ami" "redhat" {
  most_recent = true
  filter {
    name   = "name"
    values = ["RHEL-8.4.0_HVM-*-x86_64-2-Hourly2-GP2*"]
    #values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["309956199498"]
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.redhat.id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  key_name = var.key_name
  security_groups = [ aws_security_group.allow_ssh.name ]
  user_data = templatefile("${path.module}/nvme-to-block-mapping.sh", {
  devnames = join(" ", local.device_names)
  })
 tags = {
    Name = "sben_test"
  }
}

resource "aws_ebs_volume" "this" {
  for_each = var.ebs_volumes
  size = each.value["volume_size"]
  type = each.value["volume_type"]
  availability_zone = var.availability_zone
  encrypted = true
  kms_key_id = aws_kms_key.sben_kms_key.arn
}
resource "aws_volume_attachment" "this" {
  for_each = var.ebs_volumes
  device_name = each.value["device_name"]
  instance_id = aws_instance.web.id
  volume_id   = aws_ebs_volume.this[each.key].id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  #vpc_id      = aws_vpc.main.id
  ingress {
    description      = "SSH from Local"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_ssh"
  }
}

# Get ALL matching ami-ids
data "aws_ami_ids" "sben_amis" {
  owners = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-8.4.0_HVM-*-x86_64-2-Hourly2-GP2*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

