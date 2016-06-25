resource "aws_elb" "example" {
  name = "terraform-asg-deployment-example"
  subnets = ["${aws_subnet.example.*.id}"]
  security_groups = ["${aws_security_group.example.id}"]
  cross_zone_load_balancing = true
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 2
    target = "HTTP:80/"
    interval = 5
  }
}
