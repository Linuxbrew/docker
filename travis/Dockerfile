FROM quay.io/travisci/travis-ruby
LABEL maintainer="Bob W. Hogg <rwhogg@linux.com>"

RUN sudo apt-get -qq update &&\
    sudo apt-get install -y libxml-parser-perl libxml-sax-perl &&\
    env DEBIAN_FRONTEND=noninteractive sudo apt-get autoremove -y --purge\
      libblas-dev\
      libbz2-dev\
      libfreetype6-dev\
      libgdbm-dev\
      libicu-dev\
      libidn11-dev\
      libjasper-dev\
      libjbig-dev\
      libkrb5-dev\
      liblzma-dev\
      libncurses5-dev\
      libpcre3-dev\
      libtinfo-dev\
      libwebp-dev\
      libwmf-dev\
      libx11-dev\
      libxml2-dev\
      llvm-3.4\
      mysql-common\
      zlib1g-dev

# Get to the right place
RUN useradd -ms /bin/bash linuxbrew
USER linuxbrew
WORKDIR /home/linuxbrew

# Install Linuxbrew
RUN git clone https://github.com/Linuxbrew/brew.git .linuxbrew
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
ENV HOMEBREW_DEVELOPER=1 HOMEBREW_NO_AUTO_UPDATE=1
RUN ulimit -n 1024
RUN brew tap homebrew/dupes && brew tap linuxbrew/xorg
WORKDIR /home/linuxbrew/.linuxbrew/Library/Taps/homebrew/homebrew-core/Formula

# Fix error: Incorrect file permissions (664)
RUN chmod 0644 *.rb
RUN umask 022
