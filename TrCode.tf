provider "aws" {
  profile = "default"
  region = "us-east-2"
  shared_credentials_file = "/Users/arsenzvarych/TopJokes_API/credentials"
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "tja_secGroup" {
    name = "tja_secGroup"
    description = "Allow inbount tcp to port: 2077 and port: 5555"

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port   = 2077
      to_port     = 2077
      protocol    = "tcp"
    }

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port   = 5555
      to_port     = 5555
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

resource "aws_instance" "top_jokes_api" {
  ami           = "ami-05d72852800cbf29e"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
      aws_security_group.tja_secGroup.id
  ]

  tags = {
      "Terraform" = "true"
    }
}

resource "aws_eip" "top_jokes_api" {
    instance = aws_instance.top_jokes_api.id

    tags  = {
      "Terraform" = "true"
    }
}
  
