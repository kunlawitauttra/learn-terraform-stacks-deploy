locals {
  # สร้าง map ที่จับคู่ region กับ VPC CIDR block ที่กำหนด
  vpc_cidr_map = zipmap(var.regions, var.vpc_cidr_blocks)
}

resource "aws_vpc" "main" {
  for_each   = local.vpc_cidr_map
  cidr_block = each.value  # ใช้ค่า CIDR block ที่จับคู่กับแต่ละ region

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