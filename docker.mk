HOME := /root/blog
TAG := $(shell basename $(CURDIR))
VOLUME := $(CURDIR):$(HOME)
RUN := run --rm -v $(VOLUME)

bash:
	docker $(RUN) -it $(TAG) bash

build:
	docker build -t $(TAG) .

clean:
	docker rmi $(TAG)

start:
	docker $(RUN) -p 127.0.0.1:4000:4000 $(TAG) bundle exec jekyll server -w
