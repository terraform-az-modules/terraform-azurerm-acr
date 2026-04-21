# GENIE_PATH ?= $(shell pwd)/../../../genie

# ifeq ($(wildcard $(GENIE_PATH)),)
# GENIE_PATH := $(shell pwd)/genie
# endif

# include $(GENIE_PATH)/Makefile


GENIE_PATH := $(shell pwd)/.genie

.PHONY: readme
readme:
	@if [ ! -d "$(GENIE_PATH)" ]; then \
		echo "Genie not found. Please clone it first."; \
		exit 1; \
	fi

	# Run terraform-docs in repo root
	mkdir -p docs
	$(GENIE_PATH)/bin/terraform-docs md . --hide providers --hide requirements > docs/io.md

	# Run gomplate from repo root using genie templates
	$(GENIE_PATH)/bin/gomplate \
		--file $(GENIE_PATH)/views/README.md \
		--out README.md