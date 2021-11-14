resource "aws_egress_only_internet_gateway" "egress-only" {
  vpc_id = aws_vpc.VPCity.id

  tags = {
    Name = "Egress_Only_igw-TF"
  }
}