variable "aws_region" {
  type        = string
  description = "region"
  default     = "ap-south-1"
}

variable "aws_vpc_cidr_block" {
  type        = string
  description = "cidr range for the VPC"
  default     = "10.0.0.0/16"
}

variable "aws_subnet_cidr_block" {
  type        = list(string)
  description = "cidr IP range for the subnet in the VPC"
  default     = ["10.0.0.0/24"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "map public IP on launch of public subnet"
  default     = true
}

variable "project" {
  type        = string
  description = "name of the project"
}