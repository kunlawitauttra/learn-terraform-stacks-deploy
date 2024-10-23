# variable "regions" {
#   description = "List of regions to create VPC and Subnet"
#   type        =  set(string)
# }
variable "regions" {
  description = "List of regions to create VPC and Subnets"
  type        = list(string)
  default     = ["us-east-1", "us-west-1"]  # ตัวอย่าง regions
}

variable "vpc_cidr_blocks" {
  description = "Map of regions to their VPC CIDR blocks"
  type        = map(string)
}

variable "subnet_cidr_blocks" {
  description = "Map of regions to their list of Subnet CIDR blocks"
  type        = map(list(string))
}
