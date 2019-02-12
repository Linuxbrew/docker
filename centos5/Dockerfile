## STAGE 1
##   Bootstrap openssl, curl, git, file, which, xz, bzip2, tar, and portable-ruby
##   Source for curl is copied in
FROM centos:5
LABEL maintainer="Maxim Belkin <maxim.belkin@gmail.com>"
LABEL name="Linuxbrew/centos5"

# Fix yum. CentOS 5 is end-of-life as of 2017-03-31.
RUN sed -i \
    '/^mirrorlist=/d; s|^#\(baseurl=http://\).*/\([^/]*\)/\$basearch/$|\1vault.centos.org/5.11/\2/$basearch|' \
    /etc/yum.repos.d/{CentOS-Base.repo,libselinux.repo}

RUN yum install -y {make,wget,gcc,perl}.x86_64 \
	&& yum clean all

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew
ENV SHELL=/bin/bash \
	USER=linuxbrew

RUN wget --no-check-certificate -O zlib.tar.gz https://zlib.net/zlib-1.2.11.tar.gz \
    && mkdir zlib-src \
    && tar -xf zlib.tar.gz -C zlib-src --strip-components=1 \
    && cd zlib-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/zlib \
    && make install

# Bootstrap openssl (requires perl)
RUN wget -qO openssl.tar.gz https://www.openssl.org/source/openssl-1.0.2q.tar.gz \
    && mkdir -p openssl-src \
    && tar -xf openssl.tar.gz -C openssl-src --strip-components=1 \
    && cd openssl-src \
    && ./config --prefix=/home/linuxbrew/bootstrap/openssl \
            --openssldir=/home/linuxbrew/bootstrap/openssl \
            shared \
            --with-zlib-lib=/home/linuxbrew/bootstrap/zlib/lib \
            --with-zlib-include=/home/linuxbrew/bootstrap/zlib/include \
    && make \
    && make test \
    && make install \
    && cd .. \
    && rm -rf openssl.tar.gz openssl-src

# Bootstrap curl
COPY --chown=linuxbrew:linuxbrew curl-7.63.0.tar.gz /home/linuxbrew/curl.tar.gz
RUN cd /home/linuxbrew \
    && mkdir -p curl-src \
    && tar -xf curl.tar.gz -C curl-src --strip-components=1 \
    && cd curl-src \
    && env LDFLAGS=-R/home/linuxbrew/bootstrap/openssl/lib \
       ./configure --prefix=/home/linuxbrew/bootstrap/curl \
       --with-ssl=/home/linuxbrew/bootstrap/openssl \
    && make \
    && make install \
    && cd .. \
    && rm -rf curl.tar.gz curl-src


# Bootstrap xz
RUN /home/linuxbrew/bootstrap/curl/bin/curl -Lo xz.tar.gz https://downloads.sourceforge.net/project/lzmautils/xz-5.2.4.tar.gz \
    && mkdir -p xz-src \
    && tar -xf xz.tar.gz -C xz-src --strip-components=1 \
    && cd xz-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/xz \
    && make check \
    && make install \
    && cd .. \
    && rm -rf xz-src xz.tar.gz

# Bootstrap bzip2
RUN /home/linuxbrew/bootstrap/curl/bin/curl -Lo bzip2.tar.gz https://ftp.osuosl.org/pub/clfs/conglomeration/bzip2/bzip2-1.0.6.tar.gz \
    && mkdir -p bzip2-src \
    && tar -xf bzip2.tar.gz -C bzip2-src --strip-components 1 \
    && cd bzip2-src \
    && sed -i 's|$(PREFIX)/man|$(PREFIX)/share/man|g' Makefile \
    && make install PREFIX=/home/linuxbrew/bootstrap/bzip2 \
    && cd .. \
    && rm -rf bzip2-src bzip2.tar.gz

# Bootstrap tar
RUN /home/linuxbrew/bootstrap/curl/bin/curl -Lo tar.tar.gz https://ftp.gnu.org/gnu/tar/tar-1.31.tar.gz \
    && mkdir -p tar-src \
    && tar -xf tar.tar.gz -C tar-src --strip-components=1 \
    && cd tar-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/tar \
                   --mandir=/home/linuxbrew/bootstrap/tar/share/man \
                   --with-xz=/home/linuxbrew/bootstrap/xz/bin/xz \
                   --with-bzip2=/home/linuxbrew/bootstrap/bzip2/bin/bzip2 \
    && make install \
    && cd .. \
    && rm -rf tar-src tar.tar.gz

RUN /home/linuxbrew/bootstrap/curl/bin/curl -Lo gettext.tar.gz https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz \
    && mkdir -p gettext-src \
    && /home/linuxbrew/bootstrap/tar/bin/tar -xf gettext.tar.gz -C gettext-src --strip-components=1 \
    && cd gettext-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/gettext \
                   --with-included-gettext \
                   --with-included-glib \
                   --with-included-libcroco \
                   --with-included-libunistring \
                   --with-emacs \
                   --disable-java \
                   --disable-csharp \
                   --without-git \
                   --without-cvs \
                   --without-xz \
    && make \
    && make -j 1 install \
    && cd .. \
    && rm -rf gettext-src gettext.tar.gz

# Bootstrap git
RUN wget -qO git.tar.gz https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.19.2.tar.gz \
    && mkdir git-src \
    && tar -xf git.tar.gz -C git-src --strip-components=1 \
    && cd git-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/git \
       --with-openssl=/home/linuxbrew/bootstrap/openssl \
       --with-curl=/home/linuxbrew/bootstrap/curl \
       --with-zlib=/home/linuxbrew/bootstrap/zlib \
       --with-sane-tool-path=/home/linuxbrew/bootstrap/gettext/bin \
       --without-expat \
       --without-tcltk \
    && make \
    && make install \
    && cd .. \
    && rm -rf git-src git.tar.gz

# Bootstrap a recent version of 'file' that supports --print0.
RUN wget -qO libmagic.tar.gz ftp://ftp.astron.com/pub/file/file-5.35.tar.gz \
    && mkdir -p libmagic-src \
    && tar -xf libmagic.tar.gz -C libmagic-src --strip-components=1 \
    && cd libmagic-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/libmagic \
       --enable-fsect-man5 --enable-static \
    && make install \
    && mkdir -p /home/linuxbrew/bootstrap/libmagic/share/misc/magic \
    && cp -a magic/Magdir/* /home/linuxbrew/bootstrap/libmagic/share/misc/magic/ \
    && cd .. \
    && rm -rf libmagic-src libmagic.tar.gz

# Bootstrap which
RUN /home/linuxbrew/bootstrap/curl/bin/curl -Lo which.tar.gz https://carlowood.github.io/which/which-2.21.tar.gz \
    && mkdir -p which-src \
    && tar -xf which.tar.gz -C which-src --strip-components=1 \
    && cd which-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/which \
    && make \
    && make install \
    && cd .. \
    && rm -rf which-src which.tar.gz

# Bootstrap patch
RUN /home/linuxbrew/bootstrap/curl/bin/curl -Lo patch.tar.xz https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz \
    && mkdir -p patch-src \
    && /home/linuxbrew/bootstrap/tar/bin/tar -xf patch.tar.xz -C patch-src --strip-components=1 \
    && cd patch-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/patch \
    && make install \
    && cd .. \
    && rm -rf patch-src patch.tar.xz

# Bootstrap make
RUN /home/linuxbrew/bootstrap/curl/bin/curl -Lo make.tar.bz2 https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2 \
    && mkdir -p make-src \
    && /home/linuxbrew/bootstrap/tar/bin/tar -xf make.tar.bz2 -C make-src --strip-components=1 \
    && cd make-src \
    && ./configure --prefix=/home/linuxbrew/bootstrap/make \
    && make install \
    && cd .. \
    && rm -rf make-src make.tar.bz2

# Download and extract portable-ruby for Linux x86_64 from
# https://homebrew.bintray.com/bottles-portable-ruby
RUN /home/linuxbrew/bootstrap/curl/bin/curl -Lo portable-ruby.tar.gz \
     https://homebrew.bintray.com/bottles-portable-ruby/portable-ruby-2.3.3_2.x86_64_linux.bottle.tar.gz \
     && /home/linuxbrew/bootstrap/tar/bin/tar -xf portable-ruby.tar.gz -C /home/linuxbrew/bootstrap \
     && ln -s 2.3.3_2 /home/linuxbrew/bootstrap/portable-ruby/current


## Stage 2
##   Install Linuxbrew
## We're using this stage in order to:
##   1. make sure we do not depend on system's {make,wget,gcc,perl}
##   2. slim-down the image
FROM centos:5

COPY --from=0 /etc/yum.repos.d /etc/yum.repos.d

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && useradd -m -s /bin/bash linuxbrew \
    && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew
COPY --from=0 --chown=linuxbrew:linuxbrew /home/linuxbrew/bootstrap /home/linuxbrew/bootstrap

ENV SHELL=/bin/bash \
    USER=linuxbrew

ENV PATH=/home/linuxbrew/bootstrap/which/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/patch/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/tar/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/libmagic/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/openssl/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/curl/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/git/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/gettext/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/portable-ruby/current/bin:$PATH
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH

ENV HOMEBREW_DEVELOPER=1 \
    HOMEBREW_CURL_PATH=/home/linuxbrew/bootstrap/curl/bin/curl \
    HOMEBREW_GIT_PATH=/home/linuxbrew/bootstrap/git/bin/git \
    HOMEBREW_RUBY_PATH=/home/linuxbrew/bootstrap/portable-ruby/current/bin/ruby

RUN ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)" || true

# /bin/tar is too old to identify automake source file as a tar archive
# These 'ln' commands are hacks to make Homebrew use the new version of tar, which, patch, and make
RUN ln -s /home/linuxbrew/bootstrap/tar/bin/tar \
          /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/scm

RUN ln -s /home/linuxbrew/bootstrap/tar/bin/tar \
          /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/linux/super

RUN ln -s /home/linuxbrew/bootstrap/which/bin/which \
          /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/scm

## Not sure we need this symbolic link
RUN ln -s /home/linuxbrew/bootstrap/patch/bin/patch \
          /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/scm

## To use boostrapped `patch` during the installation
RUN ln -s /home/linuxbrew/bootstrap/patch/bin/patch \
          /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/linux/super

RUN ln -s /home/linuxbrew/bootstrap/make/bin/make \
          /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/scm

RUN echo -e '/*\n!git\n!svn' > /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/scm/.gitignore

RUN brew tap homebrew/portable-ruby
RUN brew tap linuxbrew/xorg

## To use bootstapped `make` during the installation
RUN sed -i 's|\$(which make)|/home/linuxbrew/bootstrap/make/bin/make|' \
          /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/linux/super/make

# for portable-openssl
RUN ln -s /home/linuxbrew/.linuxbrew/bin/perl \
    /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/shims/linux/super

 # (to make sure we don't have '/usr/bin/perl' in autoreconf)
 # (to make sure we don't have '/usr/bin/perl' in aclocal)
 # (to get rid of @@HOMEBREW_@@ stuff in glibtoolize)
RUN brew install -s autoconf automake libtool # automake depends on autoconf

RUN    brew install -s portable-ruby \
    && cp -a $(brew --cellar)/portable-ruby /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor \
    && ln -s 2.3.7 /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/current \
    && brew remove portable-ruby portable-ncurses portable-readline portable-libyaml portable-openssl

RUN unset HOMEBREW_RUBY_PATH ## HOMEBREW_FORCE_VENDOR_RUBY is set automatically
RUN unset HOMEBREW_GIT_PATH  ## HOMEBREW_FORCE_BREWED_GIT  is set automatically
RUN unset HOMEBREW_CURL_PATH ##
RUN unset HOMEBREW_DEVELOPER

RUN    brew update \
    && brew install make \
    && ( export HOMEBREW_NO_ENV_FILTERING=1; brew tests || true ) \
    && brew remove make shellcheck makedepend


## Stage 3
##   Clean up
## We're using this stage only to get rid off Homebrew cache.
FROM centos:5

# Fix yum. CentOS 5 is end-of-life as of 2017-03-31.
RUN sed -i \
    '/^mirrorlist=/d; s|^#\(baseurl=http://\).*/\([^/]*\)/\$basearch/$|\1vault.centos.org/5.11/\2/$basearch|' \
    /etc/yum.repos.d/{CentOS-Base.repo,libselinux.repo}

RUN yum install -y sudo \
    && yum clean all

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && useradd -m -s /bin/bash linuxbrew \
    && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

COPY --from=0 --chown=linuxbrew:linuxbrew /home/linuxbrew/bootstrap /home/linuxbrew/bootstrap
COPY --from=1 --chown=linuxbrew:linuxbrew /home/linuxbrew/.linuxbrew /home/linuxbrew/.linuxbrew

USER linuxbrew
WORKDIR /home/linuxbrew
ENV SHELL=/bin/bash \
    USER=linuxbrew

RUN mkdir -p /home/linuxbrew/.cache/Homebrew

ENV HOMEBREW_EDITOR=vi
ENV PATH=/home/linuxbrew/bootstrap/which/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/patch/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/xz/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/bzip2/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/tar/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/libmagic/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/openssl/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/curl/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/git/bin:$PATH
ENV PATH=/home/linuxbrew/bootstrap/portable-ruby/current/bin:$PATH
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH