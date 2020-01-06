# Linuxbrew Dockerfiles

Dockerfiles for using Linuxbrew on various distributions of Linux.

# Base Images

## Alpine 6
```sh
docker run -it linuxbrew/alpine
```

## CentOS 5
```sh
docker build -t linuxbrew/centos/5 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos/5/Dockerfile
```

## CentOS 6
```sh
docker build -t linuxbrew/centos/6 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos/6/Dockerfile
```

## CentOS 7
```sh
docker build -t linuxbrew/centos/7 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos/7/Dockerfile
```

## CentOS 8
```sh
docker build -t linuxbrew/centos/8 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos/8/Dockerfile
```

## Debian 9 (Stretch)
```sh
docker run -it linuxbrew/debian
```

## Fedora 28
```sh
docker build -t linuxbrew/fedora https://raw.githubusercontent.com/Linuxbrew/docker/master/fedora/Dockerfile
```

## OpenSUSE 42
```sh
docker build -t linuxbrew/opensuse https://raw.githubusercontent.com/Linuxbrew/docker/master/opensuse/Dockerfile
```

## Travis CI
```sh
docker run -it linuxbrew/travis
```

## Ubuntu 12.04 LTS (Precise Pangolin)
```sh
docker build -t linuxbrew/ubuntu/precise https://raw.githubusercontent.com/Linuxbrew/docker/master/ubuntu/precise/Dockerfile
```

## Ubuntu 14.04 LTS (Trusty Tahr)
```sh
docker build -t linuxbrew/ubuntu/trusty https://raw.githubusercontent.com/Linuxbrew/docker/master/ubuntu/trusty/Dockerfile
```

## Ubuntu 16.04 LTS (Xenial Xerus)

The source for this image is in the [Homebrew/brew](https://github.com/Homebrew/brew/blob/master/Dockerfile) repository.

```sh
docker run -it homebrew/brew
```

## Ubuntu 18.04 LTS (Bionic Beaver)
```sh
docker build -t linuxbrew/ubuntu/bionic https://raw.githubusercontent.com/Linuxbrew/docker/master/ubuntu/bionic/Dockerfile
```
