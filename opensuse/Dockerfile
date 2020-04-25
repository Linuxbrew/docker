# hadolint ignore=DL3007
FROM opensuse/tumbleweed:latest
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="linuxbrew/opensuse"

RUN zypper --non-interactive install curl git glibc-i18ndata glibc-locale make sudo tar which \
	&& localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	USER=linuxbrew

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
	&& brew config

CMD ["/bin/bash"]
