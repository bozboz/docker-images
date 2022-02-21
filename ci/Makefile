#vars
REPO=bozboz
IMAGENAME=ci
IMAGEFULLNAME=${REPO}/${IMAGENAME}
VERSIONS=5.6 7.0 7.3 7.4 8.0 8.1
VERSION_COUNT=4

.PHONY: generate build push buildall

run: | generate buildall

generate:
	for NUMBER in ${VERSIONS} ; do \
		[ -d $$NUMBER ] && rm -rf $$NUMBER ; \
		mkdir $$NUMBER ; \
		cat .dont-update.txt > $$NUMBER/Dockerfile ; \
		sed "s/{PHP_VERSION}/$$NUMBER/g" Dockerfile.stub >> $$NUMBER/Dockerfile ; \
		sed "s/{PHP_VERSION}/$$NUMBER/g" readme.stub > $$NUMBER/README.md ; \
		cp nvminit.sh $$NUMBER/nvminit.sh ; \
		cp npm.sh $$NUMBER/npm.sh ; \
	done

build:
	docker build -t ${IMAGEFULLNAME}:${PHP_VERSION} \
		--build-arg UID=$(shell id -u) \
		--build-arg GID=$(shell id -g) \
		${PHP_VERSION}

push:
	docker push ${IMAGEFULLNAME}:${PHP_VERSION}

buildall:
	for NUMBER in ${VERSIONS} ; do \
		make -j ${VERSION_COUNT} build -e PHP_VERSION=$$NUMBER ; \
		make -j ${VERSION_COUNT} push -e PHP_VERSION=$$NUMBER ; \
	done
