![terraform-go-http-tunnel][splash]

> terraforms to launch a go-http-tunnel server

Launches a [go-http-tunnel][go-http-tunnel] server to [Digital
Ocean][digital-ocean].

*(Possibly more providers if applicable)*


## Dependencies

You'll need to grab and place the `.tf.makefile` from
[.tf.makefile][.tf.makefile] into your checked out repo before you can proceed.


## Getting started

    $ make tf:make
    $ make digitalocean/tf:make


Will setup the terraforms for your deployment. You can then edit these files
with your own configuration,

    .provider.tfvars


for your Digital Ocean API Token, and

    digitalocean/.variables.tfvars


for your droplet and go-http-tunnel specific settings.


## TLS

    $ cd digitalocean

    $ make server-key
    $ make client-key


To generate the TLS certs necessary for your tunnel.

*Note, this is the only process that needs to be run inside the `digitalocean/`
directory.*


## SSH Keys

    $ make digitalocean/ssh-kegen


Will help you generate SSH keys for your deployment to allow you to SSH into
your box.


## Deploy

    $ make digitalocean


If you setup everything correctly this should run a successful `terraform plan`
and `apply`.


---

To check your deployment you can SSH into your box via

    $ make ssh:digitalocean


When prompted use `core` login name, as Coreos is the OS we are using.

Once SSH'd in you can check the `tunneld.service`

    {coreos} ~ $ journalctl -u tunneld.service


and should get something like

    -- Logs begin at Tue 2018-02-06 01:29:00 UTC, end at Tue 2018-02-06 02:28:37 UTC. --
    Feb 06 01:29:31 go-http-tunnel systemd[1]: Started tunneld.service.
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]:    ______         __  __________________     __                         __
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]:   / ____/___     / / / /_  __/_  __/ __ \   / /___  ______  ____  ___  / /
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]:  / / __/ __ \   / /_/ / / /   / / / /_/ /  / __/ / / / __ \/ __ \/ _ \/ /
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]: / /_/ / /_/ /  / __  / / /   / / / ____/  / /_/ /_/ / / / / / / /  __/ /
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]: \____/\____/  /_/ /_/ /_/   /_/ /_/       \__/\__,_/_/ /_/_/ /_/\___/_/
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]: github.com/mmatczuk/go-http-tunnel
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]: 2018/02/06 01:29:31 level 1 action start addr [::]:5223
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]: 2018/02/06 01:29:31 level 1 action start https addr :443
    Feb 06 01:29:31 go-http-tunnel tunneld[1214]: 2018/02/06 01:29:31 level 1 action start http addr :80


*Note, if you do happen to run into a problem, you should get a notification
once you SSH in of a systemd unit failure.*


## Enjoy

Enjoy your new go-http-tunnel server! 


Setting up tunnels to services and apps can be found [here][go-http-tunnel] at
the go-http-tunnel repo.


[splash]: https://s3.amazonaws.com/assets.github.com/splash-terraform-go-http-tunnel.svg
[digital-ocean]: https://digitalocean.com
[go-http-tunnel]: https://github.com/mmatczuk/go-http-tunnel
[.tf.makefile]: https://github.com/nowk/.tf.makefile

