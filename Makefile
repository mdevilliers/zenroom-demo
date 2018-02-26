
zenroom: ## run zenroom in a docker container
	docker run --rm -it  --entrypoint "/bin/sh" zenroom:latest

.PHONY: zenroom

docker_build: ## build the docker container that wraps zenroom
	docker build --no-cache -t zenroom .

.PHONY: docker_build

# 'help' parses the Makefile and displays the help text
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help

