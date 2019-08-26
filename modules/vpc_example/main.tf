# Define VPC
resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "VPC ${var.environment}"
    }
}

# Define the internet gateway
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}

# Define Subnet
resource "aws_subnet" "public-subnet" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.subnet_cidr}"

    tags {
        Name = "Public Subnet ${var.environment}"
    }
}

# Define Route Table
resource "aws_route_table" "public-subnet" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet  ${var.environment}"
    }
}

# Associate Route table to Subnet
resource "aws_route_table_association" "public-subnet" {
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.public-subnet.id}"
}