# Security Group Alpha
resource "aws_security_group" "Alpha" {
  name        = "Alpha"
  description = "Allow HTTP and Bravo"
  vpc_id      = aws_vpc.VPCity.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []  # if bravo included gives Error: Cycle: aws_security_group.Bravo, aws_security_group.Alpha
    self             = false
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Alpha_SG-TF"
  }
}

# Security Group Bravo
resource "aws_security_group" "Bravo" {
  name        = "Bravo"
  description = "Allow HTTP, SSH, and Alpha"
  vpc_id      = aws_vpc.VPCity.id

  ingress {
    description      = "HTTP, SSH and Alpha from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = ["${aws_security_group.Alpha.id}"]  
    self             = false
  }

    ingress {
    description      = "HTTP, SSH and Alpha from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []  
    self             = false
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Bravo_SG-TF"
  }
}

# Security Group Delta
resource "aws_security_group" "Delta" {
  name        = "Delta"
  description = "Allow all"
  vpc_id      = aws_vpc.VPCity.id

  ingress {
    description      = "HTTP, SSH and Alpha from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []  
    self             = false
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Delta_SG-TF"
  }
}