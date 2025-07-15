provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "TERRA" {
  count         = 3
  ami           = "ami-0150ccaf51ab55a51"
  instance_type = var.instance_type[count.index]
  key_name = "avk"
  vpc_security_group_ids = ["sg-084962ca46cb28cd8"]
  tags = {
    Name = var.instance_name[count.index]
  }
}

variable "instance_type" {
  default = ["t2.micro", "t2.micro", "t2.medium"]
}

variable "instance_name" {
  default = ["TOMCAT", "MONITOR-SERVER" , "JENKINS"]
}
