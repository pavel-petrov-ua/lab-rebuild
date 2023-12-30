# Output
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id, aws_subnet.subnet_c.id]
}

output "aws_igw_id" {
  value = aws_internet_gateway.ring_ring_igw.id
}

output "road_table_id" {
  value = aws_route_table.example_route_table.id
}