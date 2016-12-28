travis:
	cd travis && docker build -t linuxbrew/travis .

ubuntu:
	cd ubuntu && docker build -t linuxbrew/ubuntu .

.PHONY: travis ubuntu
