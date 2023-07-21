provider "aws" {
  region = "us-west-2" # Substitua pela sua região preferida
}

resource "aws_instance" "redis" {
  ami           = "ami-0c94855ba95c574c8" # Esta é uma AMI do Ubuntu 20.04, mas você pode usar a que preferir
  instance_type = "t2.micro" # Selecione o tipo de instância apropriado

  tags = {
    Name = "RedisInstance"
  }
}
