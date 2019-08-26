# Define AWS as our provider
provider "aws" {
  profile = "lab"
  region = "${var.aws_region}"
}
