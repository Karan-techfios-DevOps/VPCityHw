resource "aws_route_table_association" "Public-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "Private-association" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "Database-association" {
  subnet_id      = aws_subnet.database-subnet.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "Spare-association" {
  subnet_id      = aws_subnet.spare-subnet.id
  route_table_id = aws_route_table.public-rt.id
}