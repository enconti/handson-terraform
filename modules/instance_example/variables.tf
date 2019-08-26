
variable "name" {
  description = "The name for the resource"
  default = "example"
}
variable "environment" {
  description = "The env of the app"
  default = "develop"
}
variable "subnet_id" {
  description = "ID of Subnets being used"
  default = "SUBNET_ID"
}
variable "vpc_id" {
  description = "ID of VPC being used"
  default = "VPC_ID"
}
