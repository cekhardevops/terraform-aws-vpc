# Terraform AWS VPC Module Customized

This module is going to create the following resources. for HA we are going to get first 2 AZ in the region

* VPC
* Internet Gateway associated with VPC
* 2 public subnets
* 2 private subnets
* 2 database subnets
* Database subnet group
* EIP
* NAT Gateway
* public route table
* private route table
* database route table
* Routes
* Route table associated with subnets
* Peering with default VPC (if required)
* Peering routes in acceptor and requestor route tables

# inputs

* Project_name (mandatory) : user must supply value 
* environment (mandatory)  : user must supply value 
* vpc_cidr (mandatory)     : user must spply vpc_cidr
* enable_dns_hostnames (Optional) : defalut is true
* common_tags (Optional) : default is empty. User must supply tags in list(string) format
* vpc_tags (Optional) : default is empty. User must supply tags in list(string) format
* igw_tags (Optional) : default is empty. User must supply tags in list(string) format
* public_subnet_cidr (mandatory) : User must supply 2 valid public subnet cidrs
* private_subnet_cidr (mandatory) : User must supply 2 valid private subnet cidrs
* database_subnet_cidr (mandatory) : User must supply 2 valid database subnet cidrs
* database_subnet_group_tags (Optional) : default is empty. User must supply tags in list(string) format
* nat_tags (optinal) : default is empty. User must supply tags in list(string) format
* public_route_table_tags (optinal) : default is empty. User must supply tags in list(string) format
* public_route_table_tags (optinal) : default is empty. User must supply tags in list(string) format
* public_route_table_tags (optinal) : default is empty. User must supply tags in list(string) format
* vpc_peering_tags (optinal) : default is empty. User must supply tags in list(string) format
* is_peering_required (optinal) : default is false

# outputs

* vpc_id : returns expense vpc id
* public_subnet_id : returns two public subnet ids
* private_subnet_id : returns two private subnet ids
* database_subnet_id : returns two database subnet ids