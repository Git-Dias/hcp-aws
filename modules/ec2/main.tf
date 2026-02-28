resource "aws_instance" "this" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "lab-ec2-${count.index}"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = true
}

resource "aws_ec2_instance_metadata_defaults" "enforce-imdsv2" {
  http_tokens                 = "required"
  http_put_response_hop_limit = 1
}
