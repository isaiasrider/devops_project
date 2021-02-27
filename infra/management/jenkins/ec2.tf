resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.instance_type
  user_data = data.template_file.user-data.rendered
  key_name = "terraform"
  vpc_security_group_ids = [aws_security_group.example.id]
  tags = {
    Name = "Jenkins CI/CD"
  }
}


resource "aws_eip" "example-ip" {
  instance = aws_instance.example.id
  vpc = true
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data template_file "user-data" {
  template = "${file("${path.module}./script/user-data.sh")}"
  vars = {
    docker_image = "jenkins:2.60.3"
    application_port = 8080

  }
}
