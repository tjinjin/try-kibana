resource "aws_elasticsearch_domain" "es" {
    domain_name = "tf-test"
    advanced_options {
        "rest.action.multi.allow_explicit_index" = true
    }

    access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Condition": {
                "IpAddress": {"aws:SourceIp": ["${var.ES_SOURCE_IP}"]}
            }
        }
    ]
}
CONFIG

    snapshot_options {
        automated_snapshot_start_hour = 23
    }

    ebs_options {
        ebs_enabled = true
        volume_type = "gp2"
        volume_size = 10

    }

    cluster_config {
        instance_type = "t2.micro.elasticsearch"
        instance_count = 1
    }


    tags {
      Domain = "TestDomain"
    }

    lifecycle {
        ignore_changes =["access_policies"]
    }
}
