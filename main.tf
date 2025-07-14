provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "PROJECT" {
  count         = 2
  ami           = "ami-0150ccaf51ab55a51"
  instance_type = var.instance_type[count.index]
  tags = {
    Name = var.instance_name[count.index]
  }
}

variable "instance_type" {
 default = ["JENKINS-SERVER", "TOMCAT-SERVER"]
}

variable "instance_name" {
 default = ["JENKINS-SERVER", "TOMCAT-SERVER"]  
}
