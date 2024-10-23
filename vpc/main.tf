resource "aws_vpc" "main" {
  for_each   = var.regions
  cidr_block = var.vpc_cidr_blocks[each.value]

  tags = {
    Name = "vpc-${each.value}"
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