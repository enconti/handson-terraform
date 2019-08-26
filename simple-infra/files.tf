resource "null_resource" "instance" {

    count = "${var.instance_count}"

    triggers {
        node_ip = "${element(aws_instance.instance.*.public_ip, count.index)}"
    }

    connection {
        host            = "${self.triggers.node_ip}"
        type            = "ssh"
        user            = "ubuntu"
        private_key     = "${file("${var.aws_key_path}")}"
        agent           = "false"
    }

    provisioner "remote-exec" {
        script = "instance.sh"
    }
}
