resource "digitalocean_droplet" "default" {
  name = "${var.name}"

  image              = "${var.image}"
  region             = "${var.region}"
  size               = "${var.size}"
  private_networking = "${var.private_networking}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]

  user_data = "${data.template_file.user_data.rendered}"

  provisioner "file" {
    source      = ".go-http-tunnel-keys/server.key"
    destination = "/home/core/server.key"

    connection {
      type        = "ssh"
      user        = "core"
      private_key = "${file(".ssh/id_rsa")}"
    }
  }

  provisioner "file" {
    source      = ".go-http-tunnel-keys/server.crt"
    destination = "/home/core/server.crt"

    connection {
      type        = "ssh"
      user        = "core"
      private_key = "${file(".ssh/id_rsa")}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/core/.tunneld",
      "mv /home/core/server.* /home/core/.tunneld/",
      "sudo chmod 600 -R /home/core/.tunneld",
    ]

    connection {
      type        = "ssh"
      user        = "core"
      private_key = "${file(".ssh/id_rsa")}"
    }
  }
}

output "ipv4_address" {
  value = "${digitalocean_droplet.default.ipv4_address}"
}

output "ipv4_address_private" {
  value = "${digitalocean_droplet.default.ipv4_address_private}"
}
