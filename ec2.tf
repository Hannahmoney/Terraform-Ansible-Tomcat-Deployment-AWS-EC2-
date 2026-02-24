resource "aws_instance" "anstef" {
  ami           = "ami-0f3caa1cf4417e51b" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.anstef_sg.id]
  key_name = "hannh1"
  tags = {
    Name = "anstef-instance"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.anstef.public_ip} >> inventory2.ini"
  }
}
  