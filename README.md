## buidding

```
docker build -t keepassx .
```

*TODO:* test `xhost +local:`

## running

* first run
```
docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/Dropbox/backup/:/data --name keepassx --security-opt label:disable keepassx
```

here we disable SELinux inside container, or you can write policy for svirt_lxc_net_t
```
allow svirt_lxc_net_t xserver_t:unix_stream_socket connectto;
```
take a look on [Dan Walsh answer](https://bugzilla.redhat.com/show_bug.cgi?id=1151522#c1)

* second+ run
```
docker start keepassx
```
