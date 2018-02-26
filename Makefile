TAG ?= latest
REPO ?=local/qemu-user-static

build: Dockerfile
	@docker build $(BUILD_OPTS) . -f Dockerfile -t $(REPO):$(TAG)$(VARIANT)

login:
	@echo "$(DOCKER_PASSWORD)" | docker login -u="$(DOCKER_USERNAME)" --password-stdin

logout:
	@docker logout

pull:
	@docker pull $(REPO):$(TAG)$(VARIANT)

push:
	@docker push $(REPO):$(TAG)$(VARIANT)

save:
	@mkdir .images && docker save --output .images/$(TAG)$(VARIANT).tar $(REPO):$(TAG)$(VARIANT)

tag:
	@docker tag $(REPO):$(TAG)$(VARIANT) $(REPO):$(TAG)

