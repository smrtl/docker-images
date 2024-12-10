REPOSITORY=smrtl
IMAGE_NAME=debian-dev

ifeq ($(shell uname -p),arm)
DOCKER_BUILD_CMD?=docker build --platform linux/amd64
DOCKER_RUN_CMD?=docker run --platform linux/amd64
else
DOCKER_BUILD_CMD?=docker build
DOCKER_RUN_CMD?=docker run
endif

.PHONY: help
help:  ## this help message
	@grep -E '^[a-zA-Z_/-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## build the docker image
	@$(DOCKER_BUILD_CMD) -t $(REPOSITORY)/$(IMAGE_NAME) .

.PHONY: run
run: build ## run bash in the docker image
	@$(DOCKER_RUN_CMD) -ti $(REPOSITORY)/$(IMAGE_NAME) bash

.PHONY: push
push: build ## push the image to docker registry
	@docker push $(REPOSITORY)/$(IMAGE_NAME)
