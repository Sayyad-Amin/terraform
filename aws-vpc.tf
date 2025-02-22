# Create a VPC with a CIDR block of 10.0.0.0/16
resource "aws_vpc" "my-aws_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "my-aws_vpc"
    }  
}

# Create a public subnet within the VPC
resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.my-aws_vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "public-subnet"
    }
}

# Create a private subnet within the VPC
resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.my-aws_vpc.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = "private-subnet"
    }
}

# Create an Internet Gateway to allow internet access
resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-aws_vpc.id
    tags = {
      Name = "my-igw"
    }
}

# Create a route table for the public subnet
resource "aws_route_table" "my-rt" {
    vpc_id = aws_vpc.my-aws_vpc.id
    route {                            # Add a default route to the route table, directing all outbound traffic (0.0.0.0/0) to the Internet Gateway
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.my-igw.id
}
    tags = {
      Name = "my-rt"
    }
}




# Associate the public subnet with the route table, allowing it to access the internet
resource "aws_route_table_association" "public-subnet" {
    route_table_id = aws_route_table.my-rt.id
    subnet_id = aws_subnet.public-subnet.id
}
