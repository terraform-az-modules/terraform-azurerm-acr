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
	$(MAKE) -C $(GENIE_PATH) readme