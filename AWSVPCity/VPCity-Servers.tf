
/*
resource "aws_instance" "WebServer" {
  ami = "ami-04ad2567c9e3d7893"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  key_name = "aws"
  security_groups = aws_security_group.Alpha.id


  tags = {
    Name = "WebServer_TF"
  }
}

resource "aws_instance" "AppServer" {
  ami = "ami-04ad2567c9e3d7893"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private-subnet.id
  key_name = "aws"
  security_groups = aws_security_group.Bravo.id


  tags = {
    Name = "AppServer_TF"
  }
}

*/