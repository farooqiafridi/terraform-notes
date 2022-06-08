resource "aws_vpc" "vpc-001" {
    cidr_block = "192.168.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "vpc-001"
    }
}
resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.vpc-001.id
    cidr_block = "192.168.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2a"
    tags = {
        Name = "public-subnet"
    }
}
resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.vpc-001.id
    cidr_block = "192.168.2.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2b"
    tags = {
        Name = "private-subnet"
    }
}
resource "aws_internet_gateway" "affu-gateway" {
    vpc_id = aws_vpc.vpc-001.id
    tags = {
        Name = "affu-gateway"
    }
}
resource "aws_route_table"  "affu_route" {
    vpc_id = aws_vpc.vpc-001.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.affu-gateway.id
    }
    tags = {
        Name = "affu_route"
    }

}
resource "aws_route_table_association" "route-asso" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.affu_route.id
}
resource "aws_key_pair" "my-affu-key" {
    key_name = "my-affu-key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "my-affu-instance" {
   ami = "ami-05692172625678b4e"
   instance_type = "t2.micro"
   key_name = aws_key_pair.my-affu-key.key_name
   vpc_security_group_ids =  [aws_security_group.security.id]
   subnet_id = aws_subnet.public-subnet.id
   tags = {
        Name = "my-affu-instance"
    }
}
