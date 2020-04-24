FROM scratch
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="linuxbrew/scratch-onestage"

ENV HOME=/home/linuxbrew LD_LIBRARY_PATH=/lib PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/bin

COPY linuxbrew $HOME/.linuxbrew
COPY cache $HOME/.cache/Homebrew
COPY etc/passwd etc/
COPY bin /bin/
COPY lib /lib/
COPY lib64 /lib64/
COPY usr /usr/
ADD cache/portable-ruby-2.0.0-p648.x86_64_linux.bottle.tar.gz $HOME/.linuxbrew/Homebrew/Library/Homebrew/vendor/

RUN mkdir -m777 /var && mkdir -m1777 /tmp /var/tmp && chown -R 1000:1000 /bin /etc /lib /lib64 /home /usr /var

USER linuxbrew
RUN brew link libmagic \
	&& HOMEBREW_NO_AUTO_UPDATE=1 brew install --ignore-dependencies patchelf glibc \
	&& HOMEBREW_NO_AUTO_UPDATE=1 brew install curl \
		bash coreutils file-formula gawk gnu-sed gnu-tar gnu-which grep gzip util-linux \
	&& ln -s bash ~/.linuxbrew/bin/sh \
	&& brew config

USER root
# hadolint ignore=SC2114
RUN rm -rf /bin /lib && ln -s ~/.linuxbrew/bin /bin && ln -s ~/.linuxbrew/lib /lib

USER linuxbrew
WORKDIR $HOME
CMD ["/bin/bash"]
