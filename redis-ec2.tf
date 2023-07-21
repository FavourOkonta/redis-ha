provider "aws" {
  region = "us-west-2" # substitua pela sua região preferida
}

resource "aws_instance" "redis" {
  ami           = "ami-0c94855ba95c574c8" # esta é uma AMI do Ubuntu 20.04, mas você pode usar a que preferir
  instance_type = "t2.micro" # selecione o tipo de instância apropriado

  tags = {
    Name = "RedisInstance"
  }

  key_name = "my_key_pair" # substitua pela chave do par de chaves do EC2
}
