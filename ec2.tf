data "aws_ami" "ubuntu" {

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "PC1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  depends_on             = [aws_db_instance.default]
  subnet_id              = aws_subnet.prod-subnet-public-1.id
  user_data = templatefile("user-data.sh.tpl", {
    link_db = aws_db_instance.default.address
  })

  tags = {
    Name = "PC1"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "PC2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id              = aws_subnet.prod-subnet-public-2.id
  depends_on             = [aws_db_instance.default]
  user_data = templatefile("user-data.sh.tpl", {
    link_db = aws_db_instance.default.address
  })

  tags = {
    Name = "PC2"
  }

  lifecycle {
    create_before_destroy = true
  }

}