FROM ubuntu:xenial
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="Linuxbrew/xenial"

RUN apt-get update \
	&& apt-get install -y curl file g++ git locales make uuid-runtime \
	&& apt-get clean

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew

RUN git clone https://github.com/Linuxbrew/brew.git .linuxbrew

ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash

RUN brew doctor
