resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.VPCity.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Public_Subnet-TF"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.VPCity.id
  cidr_block = "10.0.1.0/25"

  tags = {
    Name = "Private_Subnet-TF"
  }
}

resource "aws_subnet" "database-subnet" {
  vpc_id     = aws_vpc.VPCity.id
  cidr_block = "10.0.1.128/26"

  tags = {
    Name = "Database_Subnet-TF"
  }
}

resource "aws_subnet" "spare-subnet" {
  vpc_id     = aws_vpc.VPCity.id
  cidr_block = "10.0.1.192/26"

  tags = {
    Name = "Spare_Subnet-TF"
  }
}