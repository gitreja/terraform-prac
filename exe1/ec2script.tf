provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "rjdemo" {
  ami                    = "ami-03ededff12e34e59e"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "vprofile-ganekey"
  vpc_security_group_ids = ["sg-08b19eb6dc68d5e8b"]
  tags = {
    Name = "mynewinstance"
    Project = "Dove"
  }
}
