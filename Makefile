travis:
	cd travis && docker build -t linuxbrew/travis $(OPTS) .

ubuntu:
        cd ubuntu && docker build -t linuxbrew/ubuntu $(OPTS) .

debian:
	cd debian && docker build -t linuxbrew/debian $(OPTS) .

.PHONY: travis ubuntu debian
