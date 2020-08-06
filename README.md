# Linuxbrew Dockerfiles

Dockerfiles for using Linuxbrew on various distributions of Linux.

# Base Images

## Alpine 6
```sh
docker run -it linuxbrew/alpine
```

## CentOS 6
```sh
docker build -t linuxbrew-centos6 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos6/Dockerfile
```

## CentOS 7
```sh
docker build -t linuxbrew-centos7 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos7/Dockerfile
```

## CentOS 8
```sh
docker build -t linuxbrew-centos8 https://raw.githubusercontent.com/Linuxbrew/docker/master/centos8/Dockerfile
```

## Debian 7 (Wheezy)
```sh
docker run -it homebrew/debian7
```

[Dockerfile](https://github.com/Homebrew/homebrew-linux-dev/blob/master/Dockerfile)

## Debian 8 (Jessie)
```sh
docker build -t linuxbrew-debian8 https://raw.githubusercontent.com/Linuxbrew/docker/master/debian8/Dockerfile
```

## Debian 9 (Stretch)
```sh
docker run -it linuxbrew/debian9
```

## Debian 10 (Buster)
```sh
docker run -it linuxbrew/debian10
```

## Fedora 31
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
docker run -it homebrew/ubuntu16.04
```

[Dockerfile](https://github.com/Homebrew/brew/blob/master/Dockerfile)

## Ubuntu 18.04 LTS (Bionic Beaver)

```sh
docker run -it homebrew/ubuntu18.04
```

[Dockerfile](https://github.com/Homebrew/brew/blob/master/Dockerfile)

## Ubuntu 20.04 LTS (Focal Fossa)

```sh
docker run -it homebrew/ubuntu20.04
```

[Dockerfile](https://github.com/Homebrew/brew/blob/master/Dockerfile)
