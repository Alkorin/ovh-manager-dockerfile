# Dockerfile with build environment for OVH's Manager

Ex with manager-dedicated:
```
$ docker run -it -p 9000:9000 $(docker build -q .)
user@1bb61c7d3da3:~$ git clone https://github.com/ovh-ux/ovh-manager-dedicated.git
user@1bb61c7d3da3:~$ cd ovh-manager-dedicated/
user@83fdb1d648a2:~/ovh-manager-dedicated$ ln -s /home/user/ssl/ server/certificate
user@83fdb1d648a2:~/ovh-manager-dedicated$ make install && grunt serve --no-open
```
