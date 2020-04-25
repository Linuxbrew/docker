FROM fedora:31
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="linuxbrew/fedora"

RUN dnf install -y curl file git glibc-locale-source make ruby rubygem-json rubygem-test-unit sudo which \
	&& dnf clean all \
	&& localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	USER=linuxbrew

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
	&& brew config

CMD ["/bin/bash"]
