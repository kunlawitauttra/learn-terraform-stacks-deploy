variable "regions" {
  description = "List of regions to create VPC and Subnet"
  type        =  set(string)
}

variable "vpc_cidr_blocks" {
  description = "Map of regions to their VPC CIDR blocks"
  type        = map(string)
}

variable "subnet_cidr_block" {
  description = "CIDR block size for subnets"
  type        = number
  default     = 24
}
