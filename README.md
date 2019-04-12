# Linuxbrew Dockerfiles

Dockerfiles for using Linuxbrew on various distributions of Linux.

# Base Images

## Alpine 6
```sh
docker run -it linuxbrew/alpine
```

## CentOS 5
```sh
docker build -t linuxbrew-centos5 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos5/Dockerfile
```

## CentOS 6
```sh
docker build -t linuxbrew-centos6 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos6/Dockerfile
```

## CentOS 7
```sh
docker build -t linuxbrew-centos7 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos7/Dockerfile
```

## Debian 9 (Stretch)
```sh
docker run -it linuxbrew/debian
```

## Fedora 28
```sh
docker build -t linuxbrew-fedora https://raw.githubusercontent.com/Linuxbrew/docker/master/fedora/Dockerfile
```

## OpenSUSE 42
```sh
docker build -t linuxbrew-opensuse https://raw.githubusercontent.com/Linuxbrew/docker/master/opensuse/Dockerfile
```

## Travis CI
```sh
docker run -it linuxbrew/travis
```

## Ubuntu 12.04 LTS (Precise Pangolin)
```sh
docker build -t linuxbrew-precise https://raw.githubusercontent.com/Linuxbrew/docker/master/precise/Dockerfile
```

## Ubuntu 14.04 LTS (Trusty Tahr)
```sh
docker build -t linuxbrew-trusty https://raw.githubusercontent.com/Linuxbrew/docker/master/trusty/Dockerfile
```

## Ubuntu 16.04 LTS (Xenial Xerus)
```sh
docker run -it linuxbrew/linuxbrew
```

## Ubuntu 18.04 LTS (Bionic Beaver)
```sh
docker run -it linuxbrew/linuxbrew
```
