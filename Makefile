

.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TASKS
# Build the container
build: ## Build the container
	docker build -t firetail .

build-nc: ## Build the container without caching
	docker build --no-cache -t firetail .

run: ## Run container
	docker run -i -t --rm --name="firetail-dev" firetail


up: build run ## Run container

stop: ## Stop and remove a running container
	docker stop $(APP_NAME); docker rm $(APP_NAME)

daemon: build ## Run the container as a daemon
	docker run -d --rm --name="firetail" firetail
