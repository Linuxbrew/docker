FROM alpine:3.6
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="Linuxbrew/alpine"

RUN apk update \
	&& apk --no-cache add bash curl file git libc6-compat make ruby ruby-irb ruby-json ruby-test-unit \
	&& adduser -D -s /bin/bash linuxbrew

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash \
	USER=linuxbrew

RUN ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)" \
	&& HOMEBREW_NO_ANALYTICS=1 brew install --ignore-dependencies patchelf glibc \
	&& HOMEBREW_NO_ANALYTICS=1 brew config

CMD ["/bin/bash"]
