output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private[*].id
}

output "database_subnet_id" {
  value = aws_subnet.database[*].id
}

# output "az_info" {
#   value = data.aws_availability_zones.available
# }

# output "default_vpc_info" {
#   value = data.aws_vpc.default_vpc
# }

# output "main_route_table_info" {
#   value = data.aws_route_table.default
# }

# output "expense_vpc_cidr" {
#   value = aws_vpc.main.cidr_block
# }