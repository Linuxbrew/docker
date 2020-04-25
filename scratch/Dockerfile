FROM linuxbrew/linuxbrew:1.9.3 AS base
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>"
LABEL name="linuxbrew/scratch"

RUN HOMEBREW_NO_AUTO_UPDATE=1 brew install glibc \
		bash coreutils curl file-formula findutils gawk git gnu-sed gnu-tar gnu-which grep gzip util-linux \
	&& rm -rf ~/.cache \
	&& ln -s bash /home/linuxbrew/.linuxbrew/bin/sh

FROM scratch
COPY --from=base /home/linuxbrew /home/linuxbrew
ENV HOME=/home/linuxbrew \
	PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin \
	USER=linuxbrew
RUN ["ln", "-s", "/home/linuxbrew/.linuxbrew/bin", "/bin"]
RUN ln -s /home/linuxbrew/.linuxbrew/lib /lib \
	&& ln -s /lib /lib64 \
	&& ln -s /home/linuxbrew/.linuxbrew /usr \
	&& mkdir -m777 /var \
	&& mkdir -m1777 /tmp /var/tmp \
	&& printf "root:x:0:0:root:/root:/bin/bash\nlinuxbrew:x:1000:1000:linuxbrew:/home/linuxbrew:/bin/bash\n" >/etc/passwd \
	&& chown -R 1000:1000 /bin /etc /lib /home /usr /var

USER linuxbrew
WORKDIR /home/linuxbrew
RUN LD_LIBRARY_PATH=/lib brew vendor-install ruby \
	&& rm -rf ~/.cache \
	&& chmod 755 /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/current/bin/ruby \
	&& patchelf --set-rpath /home/linuxbrew/.linuxbrew/lib /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/current/bin/ruby \
	&& brew config
CMD ["/bin/bash"]
