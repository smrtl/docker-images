REPOSITORY=smrtl
IMAGE_NAME=debian-dev

.PHONY: help
help:  ## this help message
	@grep -E '^[a-zA-Z_/-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## build the docker image
	@docker build -t $(REPOSITORY)/$(IMAGE_NAME) .

.PHONY: run
run: build ## run bash in the docker image
	@docker run -ti $(REPOSITORY)/$(IMAGE_NAME) bash

.PHONY: push
push: build ## push the image to docker registry
	@docker push $(REPOSITORY)/$(IMAGE_NAME)
