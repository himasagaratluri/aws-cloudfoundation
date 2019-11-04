/*
 Provider Config
*/
provider "aws" {
  region = "us-east-1"
}

/*
 VPC
*/
resource "aws_vpc" "private" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "private"
    Provisioner = "terraform"
    Environment = "dev"
  }
}

/*
 Public Subnet
*/
resource "aws_subnet" "public_subnet_us_east_1a" {
  vpc_id            = "${aws_vpc.private.id}"
  cidr_block        = "10.0.101.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet-us-east-1a"
  }
}

/*
 Private Subnet
*/
resource "aws_subnet" "private_subnet_us_east_1a" {
  vpc_id            = "${aws_vpc.private.id}"
  cidr_block        = "10.0.1.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-us-east-1a"
  }
}

/*
 Internet Gateway
*/
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.private.id}"

  tags = {
    Name = "project-igw"
  }
}

/*
 Public Route Table
*/

resource "aws_route_table" "public_route_table" {

  vpc_id = "${aws_vpc.private.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "public-route-table"
  }
}
/* 
 Public Routes
*/
resource "aws_route_table_association" "public_route_assosiation" {
  subnet_id      = "${aws_subnet.public_subnet_us_east_1a.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

/*
 Private Route Table
*/
resource "aws_route_table" "private_route_table" {

  vpc_id = "${aws_vpc.private.id}"

  tags = {
    Name = "private-route-table"
  }
}

/*
 Private Routes
*/
resource "aws_route_table_association" "private_route_assosiation" {
  subnet_id      = "${aws_subnet.private_subnet_us_east_1a.id}"
  route_table_id = "${aws_route_table.private_route_table.id}"
}