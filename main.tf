provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "TERRA" {
  count         = 3
  ami           = "var.ami"
  instance_type = var.instance_type[count.index]
  key_name = "avk"
  vpc_security_group_ids = ["sg-084962ca46cb28cd8"]
  tags = {
    Name = var.instance_name[count.index]
  }
}

variable "ami" {
  default = ["ami-0150ccaf51ab55a51", "ami-0150ccaf51ab55a51", "ami-020cba7c55df1f615"]
}

variable "instance_type" {
  default = ["t2.micro", "t2.micro", "t2.medium"]
}

variable "instance_name" {
  default = ["TOMCAT", "MONITOR-SERVER" , "JENKINS"]
}
