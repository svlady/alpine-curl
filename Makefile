REPO ?= svlady/alpine-curl
NAME = $(REPO)curl
v ?= latest

release: build
	$(call RELEASE,$(v))

build:
	$(call BUILD,$(v))

shell:
	docker run --entrypoint /bin/sh -it $(NAME)

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

