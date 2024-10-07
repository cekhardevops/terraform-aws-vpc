resource "aws_vpc_peering_connection" "main" {
  count = var.is_peering_required ? 1 : 0
  vpc_id        = aws_vpc.main.id
  peer_vpc_id   = data.aws_vpc.default_vpc.id

  auto_accept   = true

  tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name = "${local.resource_name}-default"
    }
  )
}

# public subent to default vpc peering route
resource "aws_route" "pulblic_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default_vpc.cidr_block
  vpc_peering_connection_id =  aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "private_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default_vpc.cidr_block
  vpc_peering_connection_id =  aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "database_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default_vpc.cidr_block
  vpc_peering_connection_id =  aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "default_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = data.aws_route_table.default.route_table_id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id =  aws_vpc_peering_connection.main[count.index].id
}