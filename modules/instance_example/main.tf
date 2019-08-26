resource "aws_instance" "instance" {
  ami           = "ami-c80b0aa2"
  instance_type = "t2.micro"
  subnet_id = "${var.subnet_id}"
  security_groups = [ "${aws_security_group.sg.id}" ]
}

resource "aws_security_group" "sg" {
  name = "${var.name}-sg"
  description = "Allow all inbound traffic"
  vpc_id = "${var.vpc_id}"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
