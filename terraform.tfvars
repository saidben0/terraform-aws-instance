instance_type = "t3.micro"
cidr_block = "207.229.130.177/32"
key_name = "sben_ec2_key"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeEHjErG2DpOVsRRHuX9KwT+11sG3TDtyOH8HvEphskLzyxs7U+N5i5q3gMNWwWtBfwdh2Q9a6YhmvXC2WX+emgTsqs9LtvJc3GJYrC0m/RPbqHa1cc5NfswZoS2ZZaIHy2BPUM7diY/ZysaErhps+06tJAAekpGaAXZcWsxwGPy1JuoNzgZJpRZu4xrei7rcfVgVCb3l2gQXwiODVPyIG0+M1XP2KLafjOSWmJ8ph36aI6KI//Ea7k+/FZaeANlCR3z0IA15OuXE1UbPVVcgXDJ98J+GyFZJeLf7escjBqcJL0hnKsOx0OBd32YRaE9h2hoI437o/JxfGv6P8QGxo6hR7i87NLOjiCzt5PLPBT91GJZW7qyVpnmQxl6jLp3qbFNbL0Z2tYPSW2tWfKuN4wxXYdeOVcJfVlDhWJ0DOC4a6qNrzu5cWFTltcEfNyLyGj2DMCVoPPd9XcUDIFxgRwcq+p0RA28iwdAewg9IWPpWxOjIcUaVJt0IL/QGy3Kc= saidben@SEA-1801242303"
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

