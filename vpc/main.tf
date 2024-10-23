locals {
  vpc_cidr_map = zipmap(var.regions, var.vpc_cidr_blocks)  # สร้าง map จาก regions กับ VPC CIDR blocks
}

resource "aws_vpc" "main" {
  for_each   = var.regions
  cidr_block = local.vpc_cidr_map[each.value]  # ใช้ map เพื่อเลือก CIDR block ที่ตรงกับ region

  tags = {
    Name = "vpc-${each.value}"
  }
}

resource "aws_subnet" "subnet_1" {
  for_each   = var.regions
  vpc_id     = aws_vpc.main[each.key].id
  cidr_block = var.subnet_cidr_blocks[each.value][0]  # ใช้ index 0 สำหรับ Subnet 1

  tags = {
    Name = "subnet-${each.value}-01"
  }
}

resource "aws_subnet" "subnet_2" {
  for_each   = var.regions
  vpc_id     = aws_vpc.main[each.key].id
  cidr_block = var.subnet_cidr_blocks[each.value][1]  # ใช้ index 1 สำหรับ Subnet 2

  tags = {
    Name = "subnet-${each.value}-02"
  }
}
