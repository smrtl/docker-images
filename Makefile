REPOSITORY=smrtl
IMAGE_NAME=debian_sshd

.PHONY: build
build:
	docker build -t $(REPOSITORY)/$(IMAGE_NAME) .

.PHONY: run
run:
	docker run -ti $(REPOSITORY)/$(IMAGE_NAME) bash

.PHONY: start
start:
	docker run -ti -p 2222:2222 $(REPOSITORY)/$(IMAGE_NAME)

.PHONY: publish
publish:
	docker push $(REPOSITORY)/$(IMAGE_NAME)
