output "debug_regions" {
  value = var.regions
}

output "debug_vpc_cidr_blocks" {
  value = var.vpc_cidr_blocks
}

output "debug_vpc_cidr_map" {
  value = local.vpc_cidr_map
}
