variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "Region for the VPC"
    default = "ca-central-1"
}

variable "zone_1" {
    description = "Availability Zone 1"
    default = "ca-central-1a"
}

variable "zone_2" {
    description = "Availability Zone 2"
    default = "ca-central-1b"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        ca-central-1    = "ami-0427e8367e3770df1"
        # us-east-1 = "ami-6871a115" # RedHat
        # us-east-2 = "ami-03291866" # RedHat
        # us-west-2 = "ami-28e07e50" # RedHat
        # ca-central-1 = "ami-49f0762d" # RedHat
        #us-east-1 = "ami-a4dc46db" # Ubuntu
    }
}

variable "aws_instance_type" {
    description = "Instance type"
    default = "t2.small"
}

variable "vpc_cidr" {
    description = "CIDR for the VPC"
    default = "192.168.0.0/16"
}

variable "public_subnet_zone_a_cidr" {
    description = "CIDR for the Zone A Subnet"
    default = "192.168.1.0/28"
}

variable "public_subnet_zone_b_cidr" {
    description = "CIDR for the Zone B Subnet"
    default = "192.168.3.0/28"
}

variable "subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "192.168.2.0/24"
}

variable "instance_ips" {
  default = {
    "0" = "192.168.2.111"
    "1" = "192.168.2.112"
    "2" = "192.168.2.113"
  }
}

variable "instance_count" {
    default = "2"
}