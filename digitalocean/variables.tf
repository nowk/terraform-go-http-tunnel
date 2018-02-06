variable "digitalocean_token" {}

variable "name" {}

variable "image" {
  default = "coreos-stable"
}

variable "region" {
  default = "nyc1"
}

variable "size" {
  default = "1gb"
}

variable "private_networking" {
  default = "true"
}

variable "ssh_key_name" {}

variable "go_http_tunnel_url" {
  default = "https://github.com/mmatczuk/go-http-tunnel/releases/download/2.1/tunnel_linux_amd64.tar.gz"
}

variable "go_http_tunnel_extract_filename" {
  default = "tunnel_linux_amd64.tar.gz"
}

variable "alpine_version" {
  default = "latest"
}
