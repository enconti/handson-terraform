
variable "name" {
  description = "The name for the resource"
  default = "example"
}

variable "environment" {
  description = "The env of the app"
  default = "develop"
}

variable "vpc_cidr" {
    description = "CIDR for the VPC"
    default = "192.168.0.0/16"
}

variable "subnet_cidr" {
    description = "CIDR for the Subnet"
    default = "192.168.1.0/24"
}