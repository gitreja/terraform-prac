resource "aws_instance" "rjdemo" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "vprofile-ganekey"
  vpc_security_group_ids = ["sg-08b19eb6dc68d5e8b"]
  tags = {
    Name    = "mynewinstance"
    Project = "Dove"

  }
}
