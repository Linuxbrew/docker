FROM centos:6
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"

RUN yum install -y curl c++ make sudo which

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew

RUN mkdir -p ~/.linuxbrew/Homebrew/Library/Homebrew/vendor \
	&& curl -L https://homebrew.bintray.com/bottles-portable/portable-ruby-2.0.0-p648.x86_64_linux.bottle.tar.gz \
		| tar -xz -C ~/.linuxbrew/Homebrew/Library/Homebrew/vendor \
	&& sudo chown -R linuxbrew: ~/.linuxbrew

ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash \
	USER=linuxbrew

RUN yes | ~/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/2.0.0-p648/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)" \
	&& brew config
