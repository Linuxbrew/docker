FROM centos:6
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="Linuxbrew/centos6"

RUN yum install -y curl make which \
  && yum clean all

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash linuxbrew

USER linuxbrew
WORKDIR /home/linuxbrew

ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash \
	USER=linuxbrew

RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" \
	&& brew config
