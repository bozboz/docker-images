#vars
IMAGES=ci

run:
	for IMAGE in ${IMAGES} ; do \
		cd $$IMAGE && make ; \
	done
