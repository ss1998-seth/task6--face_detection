provider "aws" {
  region                  = "ap-south-1"
  profile                 = "default"
}

resource "aws_instance" "web" {
  ami           = "ami-0ad704c126371a549"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.web.availability_zone
  size              = 5

  tags = {
    Name = "vol1"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}


