FROM debian:stretch
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"

# Set apt in non-interactive mode during the image build
ARG DEBIAN_FRONTEND=noninteractive

# Set up UTF-8
RUN apt-get update && \
    apt-get install -y apt-utils locales && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Install minimal debian packages listed in Linuxbrew documentation
RUN apt-get install -y build-essential curl file git python-setuptools ruby

# Create a linuxbrew user
RUN  useradd -m -s /bin/bash linuxbrew \
     && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
USER linuxbrew
WORKDIR /home/linuxbrew

# Install Linuxbrew from github
RUN git clone https://github.com/Linuxbrew/brew.git .linuxbrew
