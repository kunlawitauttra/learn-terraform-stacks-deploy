locals {
  regions_list = tolist(var.regions)  # แปลง set ให้เป็น list
  # สร้าง map ที่จับคู่ region กับ CIDR block
  vpc_cidr_map = zipmap(local.regions_list, var.vpc_cidr_blocks)
  # สร้าง map ของ regions สำหรับ for_each
  regions_map  = zipmap(local.regions_list, local.regions_list)
}

resource "aws_vpc" "main" {
  for_each   = local.regions_map  # ใช้ regions_map ที่สร้างจาก list
  cidr_block = local.vpc_cidr_map[each.key]  # อ้างอิง CIDR block ของแต่ละ region

  tags = {
    Name = "vpc-${each.key}"
  }
}

resource "aws_subnet" "subnet_1" {
  for_each   = var.regions
  vpc_id     = aws_vpc.main[each.key].id
  cidr_block = var.subnet_cidr_blocks[each.value][0]  # ดึงค่าแรกจาก list สำหรับ Subnet 1

  tags = {
    Name = "subnet-${each.value}-01"
  }
}

resource "aws_subnet" "subnet_2" {
  for_each   = var.regions
  vpc_id     = aws_vpc.main[each.key].id
  cidr_block = var.subnet_cidr_blocks[each.value][1]  # ดึงค่าที่สองจาก list สำหรับ Subnet 2

  tags = {
    Name = "subnet-${each.value}-02"
  }
}