resource "aws_vpc" "VPCity" {
  cidr_block = "10.0.0.0/21"


  tags = {
    Name = "VPCity-TF"
  }
}