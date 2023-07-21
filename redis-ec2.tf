provider "aws" {
  region = "us-west-2" # replace by correct region
}

resource "aws_instance" "redis" {
  ami           = "ami-0c94855ba95c574c8" # ubuntu AMI
  instance_type = "t2.micro" # select the correct size

  tags = {
    Name = "RedisInstance"
  }
}
