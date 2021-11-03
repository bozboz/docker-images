#vars
IMAGES=ci

run:
	for IMAGE in ${IMAGES} ; do \
		make -C $$IMAGE ; \
	done
