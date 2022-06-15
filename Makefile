
IMAGE_NAME = nonroot-httpbin
IMAGE_VERSION = latest
DOCKER_REPOSITORY = jjmichaud/$(IMAGE_NAME)
DOCKER_REGISTRY = docker.io

IMAGE_TAG = $(DOCKER_REGISTRY)/$(DOCKER_REPOSITORY):$(IMAGE_VERSION)


.PHONY: build
build: clean-refs build-image check

# Fresh start for every build
clean-refs:
	rm -f .current-references

.PHONY: check
check:
	@echo docker image inspect $(IMAGE_TAG)
	@docker image inspect $(IMAGE_TAG) | egrep -w "Container"
	@#
	@# need to delimit $, so it becomes $$
	@docker image inspect $(IMAGE_TAG) | sed -n -re '/RepoTags/,/],$$/p'


#push: check-refs
push: check
	@echo docker push $(IMAGE_TAG)

build-image:
	docker build \
	  --build-arg IMAGE_NAME='$(IMAGE_NAME)' \
	  -t $(IMAGE_TAG) .

