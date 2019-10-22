IMAGE=cvjupyter
VERSION=1.0.0
CONTAINER=cvjupyter

build:
	docker build -t $(IMAGE):$(VERSION) .

restart: stop start

start:
	docker run \
		-itd \
		-v $(PWD):/home/jovyan/work \
		--name $(CONTAINER) \
		-p 8888:8888 \
		$(IMAGE):$(VERSION)

contener=`docker ps -a | grep $(CONTAINER) | awk '{print $$1}'`
image=`docker images | grep $(IMAGE) | grep $() | awk '{ print $$3 }'`

clean: rm
	@if [ "$(image)" != "" ] ; then \
		docker rmi $(image); \
	fi

rm:
	@if [ "$(contener)" != "" ] ; then \
		docker rm -f $(contener); \
	fi

stop:
	@if [ "$(contener)" != "" ] ; then \
		docker rm -f $(contener); \
	fi

attach:
	docker exec -it $(CONTAINER) bash

logs:
	docker logs $(CONTAINER)
