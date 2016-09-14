# zookeeper-cluster-distribulted

Inspired by https://github.com/mesoscloud/zookeeper.

## diff

- add environment variables for zookeeper port: -e CLIENTPORT
- [ ] port forwarding to replace --net=host

## howto run

```
docker run -d \
-e MYID=1 \
-e SERVERS=node-1,node-2,node-3 \
-e CLIENTPORT=2181 \
--name=zookeeper --net=host --restart=always \
crossz/zookeeper-cluster-distribulted:latest
```

Here:
- MYID: the id sequence for zookeeper usage
- SERVERS: the hostnames/ip-address needed for zoo.cfg
- CLIENTPORT: port number equivalent to exposed port
- ENVI: environment variables if needed to pass into container from /etc/profile etc.

Notes:
> in order to avoid conflicts with local zookeeper, the default ports of 2888 and 3888 are assigned 2889 and 3889 for this images.
