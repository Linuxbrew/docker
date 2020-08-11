FROM alpine:3.11
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="linuxbrew/alpine"

RUN apk update \
	&& apk --no-cache add bash coreutils curl file g++ grep git libc6-compat make ruby ruby-bigdecimal ruby-etc ruby-fiddle ruby-irb ruby-json ruby-test-unit sudo \
	&& adduser -D -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers \
	&& ln -s /bin/touch /usr/bin/touch

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash \
	USER=linuxbrew

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
	&& HOMEBREW_NO_ANALYTICS=1 brew install -s patchelf \
	&& HOMEBREW_NO_ANALYTICS=1 brew install --ignore-dependencies binutils gmp isl@0.18 libmpc linux-headers mpfr zlib \
	&& (HOMEBREW_NO_ANALYTICS=1 brew install --ignore-dependencies gcc || true) \
	&& HOMEBREW_NO_ANALYTICS=1 brew install glibc \
	&& HOMEBREW_NO_ANALYTICS=1 brew postinstall gcc \
	&& HOMEBREW_NO_ANALYTICS=1 brew remove patchelf \
	&& HOMEBREW_NO_ANALYTICS=1 brew install -s patchelf \
	&& HOMEBREW_NO_ANALYTICS=1 brew config

CMD ["/bin/bash"]
