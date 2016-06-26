resource "aws_instance" "main" {
    ami = "${var.common_ami}"
    instance_type = "t2.micro"
    key_name = "${var.key_name}"
    vpc_security_group_ids = ["${aws_security_group.main.id}"]
    subnet_id = "${aws_subnet.main.id}"
    iam_instance_profile = "${var.iam_instance_profile}"
    root_block_device {
        delete_on_termination = "true"
    }
    tags {
        Name = "test"
        Roles = "web"
        Configuration = "terraform"
    }
}
