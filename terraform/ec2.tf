resource "aws_instance" "main" {
    ami = "ami-89634988"
    instance_type = "t2.micro"
    key_name = "${var.key_name}"
    security_groups = ["${aws_security_group.main.id}"]
    subnet_id = "${aws_subnet.main.0.id.}"
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
