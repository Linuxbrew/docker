# hadolint ignore=DL3007
FROM quay.io/travisci/travis-ruby:latest
LABEL maintainer="Bob W. Hogg <rwhogg@linux.com>"
LABEL name="linuxbrew/travis"

RUN apt-get -qq update \
    && apt-get install --no-install-recommends -y libc6-dbg libxml-parser-perl libxml-sax-perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && env DEBIAN_FRONTEND=noninteractive apt-get autoremove -y --purge\
      libblas-dev\
      libbz2-dev\
      libexpat1-dev\
      libffi-dev\
      libfontconfig1-dev\
      libfreetype6-dev\
      libgcrypt11-dev\
      libgdbm-dev\
      libgl1-mesa-dev\
      libgmp-dev\
      libicu-dev\
      libidn11-dev\
      libjack-dev\
      libjack-jackd2-0\
      libjack-jackd2-dev\
      libjack0\
      libjasper-dev\
      libjbig-dev\
      libjpeg8-dev\
      libkrb5-dev\
      libldap2-dev\
      libltdl-dev\
      liblzma-dev\
      liblzo2-dev\
      libmagic-dev\
      libncurses5-dev\
      libossp-uuid-dev\
      libpcre3-dev\
      libpq-dev\
      libsasl2-dev\
      libsqlite0-dev\
      libsqlite3-dev\
      libtinfo-dev\
      libwebp-dev\
      libwmf-dev\
      libx11-dev\
      libxml2-dev\
      libyaml-dev\
      llvm-3.4\
      mysql-common\
      unixodbc-dev\
      zlib1g-dev

# Get to the right place
RUN useradd -ms /bin/bash linuxbrew
RUN echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
USER linuxbrew
WORKDIR /home/linuxbrew
SHELL /bin/bash

# Install Linuxbrew
RUN git clone --depth=1 https://github.com/Linuxbrew/brew .linuxbrew/Homebrew
RUN mkdir -p /home/linuxbrew/.linuxbrew/bin
RUN ln -s /home/linuxbrew/.linuxbrew/Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
ENV HOMEBREW_DEVELOPER=1 HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_VERBOSE=1 HOMEBREW_VERBOSE_USING_DOTS=1
RUN ulimit -n 1024
RUN umask 022
RUN brew tap linuxbrew/xorg
WORKDIR /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula
# Fix error: Incorrect file permissions (664)
RUN chmod 0644 -- *.rb
