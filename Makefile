.DEFAULT_GOAL := help

.PHONY: clean
clean:
	[[ ! -f $$ZDOTDIR/.zsh_plugins.zsh ]] || rm $$ZDOTDIR/.zsh_plugins.zsh
	find "$$ZDOTDIR" -type f \( -name "*.zwc" -o -name "*.zwc.old" \) -delete -print

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
