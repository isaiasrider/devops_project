variable "ami" {
  description = "ami id"
  default = "ami-0a0ad6b70e61be944"
}

variable "instance_type" {
  description = "instance size"
  default = "t2.micro"
}

variable "docker_image" {
  default = "jenkins"
}