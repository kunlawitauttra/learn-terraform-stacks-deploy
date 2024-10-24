locals {
  vpc_cidr_map = zipmap(var.regions, var.vpc_cidr_blocks)  # จับคู่ regions กับ CIDR blocks
}

resource "aws_vpc" "main" {
  for_each   = local.vpc_cidr_map
  cidr_block = each.value

  tags = {
    Name = "vpc-${each.key}"
  }
}
