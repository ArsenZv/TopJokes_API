provider "aws" {
  profile = "default"
  region = "us-east-2"
  shared_credentials_file = "/Users/arsenzvarych/TopJokes_API/credentials"
}

resource "aws_vpc" "tja_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
}

resource "aws_subnet" "tja_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.tja_vpc.id
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "tja_gateway" {
  vpc_id = aws_vpc.tja_vpc.id
}

resource "aws_route_table" "tja_route" {
  vpc_id = aws_vpc.tja_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tja_gateway.id
  }

}
resource "aws_route_table_association" "custom-rt-association-1" {
  provider = aws
  route_table_id = aws_route_table.tja_route.id
  subnet_id = aws_subnet.tja_subnet.id
}



resource "aws_security_group" "tja_secGroup" {
    name = "tja_secGroup"
    description = "Allow inbount tcp to port: 2077, 8080, 22"
    vpc_id = aws_vpc.tja_vpc.id


    ingress {
      description = "SSH access"
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    }
    
    ingress {
      description = "API access"
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port   = 2077
      to_port     = 2077
      protocol    = "tcp"
    }

    ingress {
      description = "Jenkins access"
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
    }

    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    }

    tags = {
      "Terraform" = "true"
    }
}

resource "aws_key_pair" "tja_ssh" {
  key_name = "tja_ssh_key"
  public_key = "${file(".ssh/top_jokes_api_EC2.pub")}"
}

resource "aws_instance" "top_jokes_api" {
  ami           = "ami-05d72852800cbf29e"
  instance_type = "t2.micro"

  key_name = aws_key_pair.tja_ssh.key_name
  subnet_id = aws_subnet.tja_subnet.id
  vpc_security_group_ids = [aws_security_group.tja_secGroup.id]

  tags = {
      Name = "TopJokesAPI"
      "Terraform" = "true"
    }
}

resource "aws_eip" "top_jokes_api" {
    instance = aws_instance.top_jokes_api.id

    tags  = {
      "Terraform" = "true"
    }
}
  
