resource "aws_security_group" "security" {
    vpc_id = aws_vpc.vpc-001.id
    name = "security"
    description = "my-security"

    ingress {
        description = "ingress"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]



    }
    egress {
        description = "egress"
        from_port   = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "security"
    }

}
