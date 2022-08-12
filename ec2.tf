resource "aws_key_pair" "rafauth" {
  key_name   = "rafkey"
  public_key = file("~/.ssh/rafkey.pub")
}

resource "aws_instance" "web" {
  ami                         = "ami-0b152cfd354c4c7a4"
  instance_type               = "t2.micro"
  key_name                    = "rafkey"
  subnet_id                   = aws_subnet.main_public[count.index].id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count                       = 2

  tags = {
    Name = "Webserver"
  }
}

resource "aws_instance" "db" {
  ami                    = "ami-0b152cfd354c4c7a4"
  instance_type          = "t2.micro"
  key_name               = "rafkey"
  subnet_id              = aws_subnet.main_private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "Database"
  }
}