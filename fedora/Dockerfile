FROM fedora:rawhide
MAINTAINER Bob W. Hogg <rwhogg@linux.com>

RUN dnf -y update && \
    dnf -y groupinstall 'Development Tools' &&\
    dnf -y install curl file git irb python-setuptools ruby

RUN dnf -y install glibc-locale-source &&\
    localedef -i en_US -f UTF-8 en_US.UTF-8 &&\
    useradd -m -s /bin/bash linuxbrew &&\
    echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew

RUN git clone https://github.com/Linuxbrew/brew.git .linuxbrew

ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash
