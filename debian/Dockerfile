FROM debian:stretch
MAINTAINER Shaun Jackman <sjackman@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y apt-utils
RUN apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get install -y build-essential curl file git python-setuptools ruby

RUN  useradd -m -s /bin/bash linuxbrew \
     && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew

RUN git clone https://github.com/Linuxbrew/brew.git .linuxbrew

ENV PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
RUN echo 'export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH TERM=xterm' >>~/.bash_profile
RUN brew install ruby
