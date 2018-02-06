#cloud-config
# vim: set filetype=yaml :

coreos:
  units:
    - name: etcd2.service
      command: stop
      enable: false

    - name: fleet.service
      command: stop
      enable: false

    - name: pre-get-alpine.service
      content: |
        [Unit]
        After=network-online.service docker.service

        [Service]
        Type=oneshot
        ExecStart=/usr/bin/docker pull alpine:${alpine_version}
      command: start

    - name: install-tunneld.service
      content: |
        [Unit]
        After=pre-get-alpine.service

        [Service]
        Type=oneshot
        ExecStartPre=/bin/mkdir -p  /opt/bin
        ExecStartPre=/usr/bin/docker run --rm --entrypoint /usr/bin/wget \
          -v /tmp:/tmp \
          alpine:${alpine_version} -P /tmp ${go_http_tunnel_url}
        ExecStart=/usr/bin/docker run --rm --entrypoint /bin/tar \
          -v /tmp:/tmp \
          -v /opt:/opt \
          -w /tmp \
          alpine:${alpine_version} xvf ${go_http_tunnel_extract_filename} -C /opt/bin
        ExecStartPost=-/bin/rm /opt/bin/tunnel
      command: start

    - name: tunneld.service
      content: |
        [Unit]
        After=install-tunneld.service

        [Service]
        ExecStart=/opt/bin/tunneld \
          -tlsCrt /home/core/.tunneld/server.crt \
          -tlsKey /home/core/.tunneld/server.key
        Restart=on-failure
      command: start

