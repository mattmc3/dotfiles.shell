.DEFAULT_GOAL := help

.PHONY: submodules
submodules:
	git submodule update --recursive --remote

.PHONY: help
help:
	@echo "help"
	@echo "    shows this message"
	@echo ""
	@echo "submodules"
	@echo "    Updates submodules. "
