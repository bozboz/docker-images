#vars
REPO=bozboz
IMAGENAME=ci
IMAGEFULLNAME=${REPO}/${IMAGENAME}
VERSIONS=7.0 7.3 7.4 8.0
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
		cp nvm.sh $$NUMBER/nvm.sh ; \
		cp npm.sh $$NUMBER/npm.sh ; \
	done

build:
	docker build ${PHP_VERSION} -t ${IMAGEFULLNAME}:${PHP_VERSION}

push:
	docker push ${IMAGEFULLNAME}:${PHP_VERSION}

buildall:
	for NUMBER in ${VERSIONS} ; do \
		make -j ${VERSION_COUNT} build -e PHP_VERSION=$$NUMBER ; \
		make -j ${VERSION_COUNT} push -e PHP_VERSION=$$NUMBER ; \
	done
