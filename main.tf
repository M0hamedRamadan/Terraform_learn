provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
resource "aws_vpc" "vpc-network" {
  cidr_block = var.cidr_block-vpc[0].cidr_block
  tags = {
    name : var.cidr_block-vpc[0].name
  }
}

resource "aws_subnet" "network_subnet" {

  vpc_id            = aws_vpc.vpc-network.id
  cidr_block        = var.cidr_block-subnet[0]
  availability_zone = var.availability_zone
}
output "vpc_id" {
  value = aws_vpc.vpc-network.id

}

resource "aws_network_interface" "instance_ip" {
  subnet_id   = aws_subnet.network_subnet.id
  private_ips = var.instance_ip
  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.instance_ip.id
    device_index         = 0
  }
}


