# makefile
.PHONY: help formatted
.DEFAULT_GOAL := help

submodules:
	git submodule update --recursive --remote

help:
	@echo "help"
	@echo "    shows this message"
	@echo ""
	@echo "submodules"
	@echo "    Update git submodules. "
