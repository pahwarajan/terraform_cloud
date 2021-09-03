provider "aws" {
  region     = "ap-south-1"
  profile = “default”
}

provider "aws" {
  region     = "us-west-1"
  profile = “user1”
  alias = “grras”	
}

resource "aws_instance" "myec2" {
  ami = "ami-08f63db601b82ff5f"
  instance_type = "t2.micro"
  provisioner "local-exec" {
  command = "echo ${aws_instance.myec2.private_ip} > a.txt"
}

resource "aws_instance" "myec2" {
  ami = "ami-08f63db601b82ff5f"
  instance_type = "t2.micro"
  provisioner "local-exec" {
  command = "echo ${aws_instance.myec2.private_ip} > a.txt"
  provider = aws.grras	
}
}
