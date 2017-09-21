.DELETE_ON_ERROR:
.SECONDARY:
.PHONY: all clean

all: \
	linuxbrew/bin/brew \
	linuxbrew/Cellar/libmagic/5.32/share/misc/magic.mgc \
	linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/README.md \
	cache/curl-7.55.1.x86_64_linux.bottle.tar.gz \
	cache/glibc-2.23.x86_64_linux.bottle.tar.gz \
	cache/openssl--cacert-2017-01-18.pem \
	cache/openssl-1.0.2l.x86_64_linux.bottle.tar.gz \
	cache/patchelf-0.9_1.x86_64_linux.bottle.tar.gz \
	cache/portable-ruby-2.0.0-p648.x86_64_linux.bottle.tar.gz \
	cache/zlib-1.2.11.x86_64_linux.bottle.tar.gz \
	etc/passwd \
	bin/awk \
	bin/basename \
	bin/cat \
	bin/chown \
	bin/cut \
	bin/dirname \
	bin/file \
	bin/flock \
	bin/getconf \
	bin/gzip \
	bin/head \
	bin/id \
	bin/ln \
	bin/mkdir \
	bin/nice \
	bin/readlink \
	bin/rm \
	bin/sh \
	bin/sha256sum \
	bin/tar \
	bin/uname \
	bin/which \
	usr/bin/which \
	lib/libc-2.23.so lib/libc.so.6 \
	lib/libcrypt-2.23.so lib/libcrypt.so.1 \
	lib/libdl-2.23.so lib/libdl.so.2 \
	lib/libm-2.23.so lib/libm.so.6 \
	lib/libpthread-2.23.so lib/libpthread.so.0 \
	lib/librt-2.23.so lib/librt.so.1 \
	lib/libutil-2.23.so lib/libutil.so.1 \
	lib/libgmp.so.10.3.1 lib/libgmp.so.10 \
	lib/libmagic.so.1.0.0 lib/libmagic.so.1 \
	lib/libmpfr.so.4.1.5 lib/libmpfr.so.4 \
	lib/libncursesw.so.6.0 lib/libncursesw.so.6 \
	lib/libreadline.so.7.0 lib/libreadline.so.7 \
	lib/libz.so.1.2.11 lib/libz.so.1 \
	lib64/ld-2.23.so lib64/ld-linux-x86-64.so.2

clean:
	rm -rf bin cache etc lib lib64 usr

linuxbrew/Homebrew/bin/brew:
	git clone --depth=1 https://github.com/Linuxbrew/brew linuxbrew/Homebrew

linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/README.md:
	git clone --depth=1 https://github.com/Linuxbrew/homebrew-core $(@D)

linuxbrew/bin/brew: linuxbrew/Homebrew/bin/brew
	mkdir -p $(@D)
	ln -s ../Homebrew/bin/brew $@

bottles/%.tar.gz: ~/.cache/Homebrew/%.tar.gz
	mkdir -p $(@D)
	cp -p $< $@

bottles/%:
	mkdir -p $(@D)
	curl -L -o $@ https://linuxbrew.bintray.com/bottles/$(@F)

cache/portable-ruby-2.0.0-p648.x86_64_linux.bottle.tar.gz:
	mkdir -p $(@D)
	curl -L -o $@ https://homebrew.bintray.com/bottles-portable/portable-ruby-2.0.0-p648.x86_64_linux.bottle.tar.gz

cache/openssl--cacert-2017-01-18.pem:
	mkdir -p $(@D)
	curl -L -o $@ https://curl.haxx.se/ca/cacert-2017-01-18.pem

cache/%: bottles/%
	mkdir -p $(@D)
	cp -p $< $@

linuxbrew/Cellar/libmagic/5.32/share/misc/magic.mgc: bottles/libmagic-5.32.x86_64_linux.bottle.tar.gz
	mkdir -p linuxbrew/Cellar
	tar -C linuxbrew/Cellar -xf $<
	touch $@

Cellar/bash/4.4.12/INSTALL_RECEIPT.json: bottles/bash-4.4.12.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/coreutils/8.27/INSTALL_RECEIPT.json: bottles/coreutils-8.27.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/file-formula/5.32/INSTALL_RECEIPT.json: bottles/file-formula-5.32.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/gawk/4.1.4_1/INSTALL_RECEIPT.json: bottles/gawk-4.1.4_1.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/glibc/2.23/INSTALL_RECEIPT.json: bottles/glibc-2.23.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/gmp/6.1.1/INSTALL_RECEIPT.json: bottles/gmp-6.1.1.x86_64_linux.bottle.1.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/gnu-tar/1.29_1/INSTALL_RECEIPT.json: bottles/gnu-tar-1.29_1.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/gzip/1.8/INSTALL_RECEIPT.json: bottles/gzip-1.8.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/libmagic/5.32/INSTALL_RECEIPT.json: bottles/libmagic-5.32.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/mpfr/3.1.5/INSTALL_RECEIPT.json: bottles/mpfr-3.1.5.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/ncurses/6.0_3/INSTALL_RECEIPT.json: bottles/ncurses-6.0_3.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/readline/7.0.3_1/INSTALL_RECEIPT.json: bottles/readline-7.0.3_1.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/util-linux/2.29_1/INSTALL_RECEIPT.json: bottles/util-linux-2.29_1.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

Cellar/zlib/1.2.11/INSTALL_RECEIPT.json: bottles/zlib-1.2.11.x86_64_linux.bottle.tar.gz
	mkdir -p Cellar
	tar -xf $< -C Cellar
	touch $@

bin/basename bin/cat bin/chown bin/cut bin/dirname bin/head bin/id bin/ln bin/mkdir bin/nice bin/readlink bin/rm bin/sha256sum bin/uname: Cellar/coreutils/8.27/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp $(<D)/$@ $@

bin/bash: Cellar/bash/4.4.12/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp $(<D)/$@ $@

bin/file: Cellar/file-formula/5.32/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp $(<D)/$@ $@

bin/gawk: Cellar/gawk/4.1.4_1/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp $(<D)/$@ $@

bin/tar: Cellar/gnu-tar/1.29_1/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp $(<D)/$@ $@

bin/gzip: Cellar/gzip/1.8/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp $(<D)/$@ $@

bin/flock: Cellar/util-linux/2.29_1/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp $(<D)/$@ $@

bin/getconf \
	lib/libc-2.23.so lib/libc.so.6 \
	lib/libcrypt-2.23.so lib/libcrypt.so.1 \
	lib/libdl-2.23.so lib/libdl.so.2 \
	lib/libm-2.23.so lib/libm.so.6 \
	lib/libpthread-2.23.so lib/libpthread.so.0 \
	lib/librt-2.23.so lib/librt.so.1 \
	lib/libutil-2.23.so lib/libutil.so.1: \
		Cellar/glibc/2.23/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp -R $(<D)/$@ $@

lib/libgmp.so.10.3.1 lib/libgmp.so.10: Cellar/gmp/6.1.1/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp -R $(<D)/$@ $@

lib/libmagic.so.1.0.0 lib/libmagic.so.1: Cellar/libmagic/5.32/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp -R $(<D)/$@ $@

lib/libmpfr.so.4.1.5 lib/libmpfr.so.4: Cellar/mpfr/3.1.5/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp -R $(<D)/$@ $@

lib/libncursesw.so.6 lib/libncursesw.so.6.0: Cellar/ncurses/6.0_3/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp -R $(<D)/$@ $@

lib/libreadline.so.7.0 lib/libreadline.so.7: Cellar/readline/7.0.3_1/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp -R $(<D)/$@ $@

lib/libz.so.1.2.11 lib/libz.so.1: Cellar/zlib/1.2.11/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp -R $(<D)/$@ $@

lib64/ld-linux-x86-64.so.2 lib64/ld-2.23.so: Cellar/glibc/2.23/INSTALL_RECEIPT.json
	mkdir -p $(@D)
	cp -R $(<D)/$@ $@

bin/awk: bin/gawk
	ln -s $(<F) $@

bin/sh: bin/bash
	ln -s $(<F) $@

bin/which:
	printf '#!/bin/sh\ntype -P "$$@"\n' >$@
	chmod +x $@

usr/bin/which:
	mkdir -p usr
	ln -s ../bin usr/

etc/passwd:
	mkdir -p $(@D)
	printf "root:x:0:0:root:/root:/bin/bash\nlinuxbrew:x:1000:1000:linuxbrew:/home/linuxbrew:/bin/bash\n" >$@
