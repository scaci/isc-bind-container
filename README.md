# isc-bind-container
ISC Bind container on Centos 7

Source file to build ISC Bind container based on Centos 7 release: clone repository and execute ./build.sh to make container image

## Start recurse dns:

```
docker run -d -it \
--name bind --publish 53:53/tcp --publish 53:53/udp \
bind-container:alpha
```

## Start recurse dns with persistent storage (ensure to create directory /DATA or what else you need):

```
docker run -d -it \
--name bind-localconf --publish 53:53/tcp --publish 53:53/udp \
-v /DATA/etc:/etc \
-v /DATA/var/named:/var/named \
bind-container:alpha
```

## Start recurse dns passing extra command arguments:

```
docker run  -d -it \
--name bind-localconf-4 --publish 53:53/tcp --publish 53:53/udp \
-v /DATA/etc:/etc \
-v /DATA/var/named:/var/named \
bind-container:alpha arg1
```

For example set arg1 to -4 to use IPv4 only even if the host machine is capable of IPv6
