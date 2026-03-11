provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0ecb62995f68bb549"
  instance_type          = "c7i-flex.large"
  key_name               = "training_ncpl_tf"
  subnet_id              = "subnet-071b6fdf79d2c4741"
  vpc_security_group_ids = ["sg-06a6104d0ac9762c2"]

  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
