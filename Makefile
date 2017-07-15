travis:
	cd travis && docker build -t linuxbrew/travis $(OPTS) .

debian:
	cd debian && docker build -t linuxbrew/debian $(OPTS) .

.PHONY: travis debian
