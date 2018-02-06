# tf:varfiles

DIGITALOCEAN_VAR_FILES= \
	-var-file=./.variables.tfvars \
	-var-file=../.provider.tfvars \
	-var-file=../.variables.tfvars

# /tf:varfiles

# tf:targets

digitalocean:
	@$(MAKE) -s $@/tf:apply!
.PHONY: digitalocean

# /tf:targets

#eof
