# GENIE_PATH ?= $(shell pwd)/../../../genie

# ifeq ($(wildcard $(GENIE_PATH)),)
# GENIE_PATH := $(shell pwd)/genie
# endif

# include $(GENIE_PATH)/Makefile


GENIE_PATH := $(shell pwd)/.genie

.PHONY: genie-init
genie-init:
	@if [ ! -d "$(GENIE_PATH)" ]; then \
		echo "Cloning Genie..."; \
		git clone https://${{ secrets.GITHUB }}@github.com/terraform-az-modules/genie.git $(GENIE_PATH); \
	else \
		echo "Genie already exists"; \
	fi

.PHONY: readme
readme: genie-init
	$(MAKE) -C $(GENIE_PATH) readme