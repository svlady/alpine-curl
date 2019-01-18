REPO ?= registry.eu-de.bluemix.net/daivb_log/
NAME = $(REPO)curl
v ?= 7.61.1-alpine

release: build
	$(call RELEASE,$(v))

build:
	$(call BUILD,$(v))

run: build
	docker run -it $(NAME)

define BUILD
	docker build --build-arg VERSION=$(1) -t $(NAME) .
	docker tag $(NAME) $(NAME):$(1)
endef

define RELEASE
	$(call BUILD,$(1));
	# git push
	docker tag $(NAME) $(NAME):$(1)
	docker push $(NAME):$(1)
endef

bash:
	docker run --entrypoint /bin/bash -it $(NAME)
