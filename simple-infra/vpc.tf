# Define VPC
resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "Instance VPC"
    }
}

# Define the internet gateway
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}


# Criação IP Publico para o Nat gateway
resource "aws_eip" "eip" {
  vpc = true
}

# Criação NAT Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.public-subnet-zone-b.id}"
}


/*
  Public Subnet A
*/
resource "aws_subnet" "public-subnet-zone-a" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_zone_a_cidr}"
    availability_zone = "${var.zone_1}"

    tags {
        Name = "Public Subnet Zone A"
    }
}

resource "aws_route_table" "public-subnet-zone-a" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet Zone A"
    }
}

resource "aws_route_table_association" "public-subnet-zone-a" {
    subnet_id = "${aws_subnet.public-subnet-zone-a.id}"
    route_table_id = "${aws_route_table.public-subnet-zone-a.id}"
}

/*
  Public Subnet B
*/
resource "aws_subnet" "public-subnet-zone-b" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_zone_b_cidr}"
    availability_zone = "${var.zone_2}"

    tags {
        Name = "Public Subnet Zone B"
    }
}

resource "aws_route_table" "public-subnet-zone-b" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet Zone B"
    }
}

resource "aws_route_table_association" "public-subnet-zone-b" {
    subnet_id = "${aws_subnet.public-subnet-zone-b.id}"
    route_table_id = "${aws_route_table.public-subnet-zone-b.id}"
}

/*
  Private Subnet
*/
resource "aws_subnet" "private-subnet" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.subnet_cidr}"
    availability_zone = "${var.zone_1}"

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table" "private-subnet" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "private-subnet" {
    subnet_id = "${aws_subnet.private-subnet.id}"
    route_table_id = "${aws_route_table.private-subnet.id}"
}
