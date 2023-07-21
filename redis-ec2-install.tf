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
      private_key = file("~/.ssh/id_rsa") # replace by correct place of id_rsa pub/priv key
      host        = self.public_ip
    }
  }
}
