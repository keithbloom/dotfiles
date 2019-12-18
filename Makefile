.PHONY: test
test: ## Runs the tests for all files

.PHONY: dotfiles
dotfiles: ## Installs the dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git"); do \
	       	f=$$(basename $$file); \
			## if [ -d $(HOME)/$$f ]; then $(HOME)/$$f; fi; \
       		ln -sfn $$file $(HOME)/$$f; \
	done

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%.30s\033[0m %s\n", $$1, $$2}'
