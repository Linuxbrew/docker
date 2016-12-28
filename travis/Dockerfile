FROM quay.io/travisci/travis-ruby
MAINTAINER Bob W. Hogg <rwhogg@linux.com>

RUN sudo apt-get -qq update && sudo apt-get install -y libxml-parser-perl libxml-sax-perl libcpan-meta-perl && sudo apt-get remove -y libncurses5-dev libtinfo-dev

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
