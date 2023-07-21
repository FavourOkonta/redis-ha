resource "aws_instance" "redis" {
  # ...

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y redis-server",
      "sudo systemctl enable redis-server",
      "sudo systemctl start redis-server"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa") # Substitua pela localização correta da sua chave privada SSH
      host        = self.public_ip
    }
  }
}
