travis:
	cd travis && docker build -t linuxbrew/travis $(OPTS) .

ubuntu:
	cd ubuntu && docker build -t linuxbrew/ubuntu $(OPTS) .

.PHONY: travis ubuntu
