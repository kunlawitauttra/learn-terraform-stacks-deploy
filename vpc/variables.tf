variable "regions" {
  description = "List of regions to create VPC and Subnet"
  type        =  set(string)
}

variable "vpc_cidr_blocks" {
  description = "List of VPC CIDR blocks matching the order of regions"
  type        = list(string)
}

variable "subnet_cidr_blocks" {
  description = "Map of regions to their list of Subnet CIDR blocks"
  type        = map(list(string))
}

