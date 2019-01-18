REPO ?= svlady
NAME = $(REPO)/alpine-curl
PKG_VERSION  ?= 7.61.1-r1
TAG = $(PKG_VERSION)

build:
	docker build --build-arg PKG_VERSION=$(PKG_VERSION) -t $(NAME) .
	docker tag $(NAME) $(NAME):$(TAG)

release: build
	docker push $(NAME):$(TAG)

run: build
	docker run -it --rm --net=host $(NAME):$(TAG) --version

shell:
	docker run -it --rm --net=host --entrypoint=/bin/sh $(NAME):$(TAG)
