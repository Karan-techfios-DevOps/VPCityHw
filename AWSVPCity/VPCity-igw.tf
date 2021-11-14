resource "aws_internet_gateway" "VPCity-igw" {
  vpc_id = aws_vpc.VPCity.id

  tags = {
    Name = "VPCity_igw-TF"
  }
}