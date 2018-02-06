# %-key creates the go-http-tunnel keys required, use client-key and server-key
# respectively
%-key:
	@openssl req -x509 -nodes -newkey rsa:2048 -sha256 \
		-keyout .go-http-tunnel-keys/$*.key \
		-out .go-http-tunnel-keys/$*.crt
.PHONY: %-key

# tf:targets

plan:
	@$(MAKE) -s digitalocean/tf:$@;
.PHONY: plan

apply:
	@$(MAKE) -s digitalocean/tf:$@;
.PHONY: apply

apply!:
	@$(MAKE) -s digitalocean/tf:$@;
.PHONY: apply!

destroy:
	@$(MAKE) -s digitalocean/tf:$@;
.PHONY: destroy

# /tf:targets

include ._tf.makefile
include ../.tf.makefile

#eof
