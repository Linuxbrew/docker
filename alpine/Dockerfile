FROM alpine:3.7
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="linuxbrew/alpine"

RUN apk update \
	&& apk --no-cache add bash curl file git libc6-compat make ruby ruby-irb ruby-json ruby-test-unit sudo \
	&& adduser -D -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash \
	USER=linuxbrew

RUN ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)" \
	&& HOMEBREW_NO_ANALYTICS=1 brew install --ignore-dependencies patchelf glibc \
	&& HOMEBREW_NO_ANALYTICS=1 brew config

CMD ["/bin/bash"]
