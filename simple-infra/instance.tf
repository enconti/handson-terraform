/*
  Instance
*/
resource "aws_security_group" "instance-sg" {
    name = "instance-sg"
    description = "Allow incoming connections."

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress { 
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Instance SG"
    }
}

resource "aws_instance" "instance" {
    count = "${var.instance_count}"

    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "${var.zone_1}"
    instance_type = "${var.aws_instance_type}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.instance-sg.id}"]
    subnet_id = "${aws_subnet.public-subnet-zone-a.id}"
    associate_public_ip_address = true
    source_dest_check = false
    user_data = "${file("config.sh")}"

    tags {
        Name = "Instance ${count.index}"
    }
}

resource "aws_eip" "instance" {
    instance = "${aws_instance.instance.*.id}"
    vpc = true
}