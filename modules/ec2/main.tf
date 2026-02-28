resource "aws_instance" "this" {
  count = var.instance_count

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  associate_public_ip_address = var.enable_public_ip

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tags = {
    Name = "lab-ec2-${count.index}"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = true
}
