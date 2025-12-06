resource "aws_instance" "this" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "lab-ec2-${count.index}"
  }
}
