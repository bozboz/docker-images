#vars
REPO=bozboz
IMAGENAME=ci
IMAGEFULLNAME=${REPO}/${IMAGENAME}
VERSIONS=7.0 7.3 7.4 8.0

.PHONY: run generate build push

run: | generate build push

generate:
	for NUMBER in ${VERSIONS} ; do \
		[ -d $$NUMBER ] && rm -rf $$NUMBER ; \
		mkdir $$NUMBER ; \
		echo '#####################################' > $$NUMBER/Dockerfile ; \
		echo '# DO NOT EDIT THIS FILE DIRECTLY!!! #' >> $$NUMBER/Dockerfile ; \
		echo '#####################################' >> $$NUMBER/Dockerfile ; \
		echo '# This is an automatically generated file from a stub in /ci.' >> $$NUMBER/Dockerfile ; \
		echo '# Make any required changes there and then regenerate.' >> $$NUMBER/Dockerfile ; \
		echo "\n\n\n\n\n\n\n\n\n\n\n\n" >> $$NUMBER/Dockerfile ; \
		cat Dockerfile.stub >> $$NUMBER/Dockerfile ; \
		sed -i "s/{PHP_VERSION}/$$NUMBER/g" $$NUMBER/Dockerfile ; \
		cp readme.stub $$NUMBER/README.md ; \
		sed -i "s/{PHP_VERSION}/$$NUMBER/g" $$NUMBER/README.md ; \
		cp nvm.sh $$NUMBER/nvm.sh ; \
	done

build:
	for NUMBER in ${VERSIONS} ; do \
		docker build $$NUMBER -t ${IMAGEFULLNAME}:$$NUMBER ; \
	done

push:
	for NUMBER in ${VERSIONS} ; do \
		docker push ${IMAGEFULLNAME}:$$NUMBER ; \
	done