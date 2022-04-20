resource "aws_key_pair" "demo-key" {

  key_name   = "demokey"
  public_key = file("demokey.pub")
}

resource "aws_instance" "rjdemo" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.demo-key.key_name
  vpc_security_group_ids = ["sg-08b19eb6dc68d5e8b"]
  tags = {
    Name    = "mynewinstance"
    Project = "Dove"

  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"

  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("demokey")
    host        = self.public_ip

  }
}


