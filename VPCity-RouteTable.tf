# Public Route Table

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.VPCity.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.VPCity-igw.id
  }
  /* DO NOT NEED TO INCLUDE THIS
  route {
    cidr_block = "10.0.0.0/21"
    gateway_id = aws_internet_gateway.VPCity-igw.id
  }
  */
  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egress-only.id
  }

  tags = {
    Name = "Public_RT-TF"
  }
}

# Private Route Table

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.VPCity.id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_nat_gateway.VPCity-NAT-gw.id
  }
  /* DO NOT NEED INCLUDE THIS
  route {
    cidr_block = "10.0.1.0/25"
    gateway_id = aws_nat_gateway.VPCity-NAT-gw.id
  }
  */
  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egress-only.id
  }

  tags = {
    Name = "Private_RT-TF"
  }
}
