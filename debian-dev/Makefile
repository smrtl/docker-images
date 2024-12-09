TAG=smrtl/debian-dev

.PHONY: build
build:
	docker build . -t $(TAG)

.PHONY: run
run: build
	docker run -ti $(TAG) bash

.PHONY: push
push: build
	docker push $(TAG)
