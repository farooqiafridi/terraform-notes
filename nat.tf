resource "aws_eip" "ip" {
    vpc = "true"
}
resource "aws_nat_gateway" "gws" {
    allocation_id = aws_eip.ip.id
    subnet_id = aws_subnet.private-subnet.id
    depends_on = [aws_internet_gateway.affu-gateway]

    tags = {
        Name = "gws"
    }
}
resource "aws_route_table" "private-route" {
    vpc_id = aws_vpc.vpc-001.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.gws.id

    }
    tags = {
        Name = "private-route"
    }
}
resource "aws_route_table_association" "private-asso" {
    subnet_id = aws_subnet.private-subnet.id
    route_table_id = aws_route_table.private-route.id
}

