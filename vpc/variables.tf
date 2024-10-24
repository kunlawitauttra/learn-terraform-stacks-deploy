variable "regions" {
  description = "List of regions to create VPC"
  type        = list(string)
}

variable "vpc_cidr_blocks" {
  description = "List of VPC CIDR blocks matching the order of regions"
  type        = list(string)
}

