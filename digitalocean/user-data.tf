data "template_file" "user_data" {
  template = "${file("user-data.tpl")}"

  vars {
    go_http_tunnel_url              = "${var.go_http_tunnel_url}"
    go_http_tunnel_extract_filename = "${var.go_http_tunnel_extract_filename}"

    alpine_version = "${var.alpine_version}"
  }
}
