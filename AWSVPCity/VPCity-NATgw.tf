resource "aws_nat_gateway" "VPCity-NAT-gw" {
  allocation_id = aws_eip.VPCity_eip_nat_gateway.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = {
    Name = "VPCity_nat_gw-TF"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.VPCity-igw]
}