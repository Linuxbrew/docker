# Build image

```

To build the image, run:
```
make debian
```

# Run the container

Run the machine with:
```
docker run -d linuxbrew/debian tail -f /dev/null
```

# Enter the container

Use docker-enter to enter the container:
```
docker-enter() { boot2docker ssh -t "[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter; sudo /var/lib/boot2docker/docker-enter $@"; }

docker-enter <container>
```

# References
* [Docker via Homebrew](https://penandpants.com/2014/03/09/docker-via-homebrew/)
* [If you run SSHD in your Docker containers, you're doing it wrong!](https://jpetazzo.github.io/2014/06/23/docker-ssh-considered-evil/)
