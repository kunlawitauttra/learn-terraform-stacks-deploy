output "vpc_ids" {
  description = "VPC IDs for each region"
  value       = { for region, vpc in aws_vpc.main : region => vpc.id }
}

output "subnet_1_ids" {
  description = "Subnet 1 IDs for each region"
  value       = { for region, subnet in aws_subnet.subnet_1 : region => subnet.id }
}

output "subnet_2_ids" {
  description = "Subnet 2 IDs for each region"
  value       = { for region, subnet in aws_subnet.subnet_2 : region => subnet.id }
}


output "debug_regions" {
  value = var.regions
}

output "debug_vpc_cidr_blocks" {
  value = var.vpc_cidr_blocks
}

output "debug_vpc_cidr_map" {
  value = local.vpc_cidr_map
}
