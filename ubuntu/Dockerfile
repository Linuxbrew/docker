FROM ubuntu:xenial
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN apt-get update \
	&& apt-get install -y curl file g++ git make ruby2.3 ruby2.3-dev uuid-runtime \
	&& ln -sf ruby2.3 /usr/bin/ruby \
	&& ln -sf gem2.3 /usr/bin/gem

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
RUN git clone https://github.com/Linuxbrew/brew.git /home/linuxbrew/.linuxbrew \
    && chown -R linuxbrew: /home/linuxbrew/.linuxbrew

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash
