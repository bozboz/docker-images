#vars
IMAGES=ci

run:
	for IMAGE in ${IMAGES} ; do \
		make -d -C $$IMAGE ; \
	done
