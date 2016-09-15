#!/bin/sh -ex

echo "${MYID:-1}" > /tmp/zookeeper/myid

# based on https://github.com/apache/zookeeper/blob/trunk/conf/zoo_sample.cfg
cat > /opt/zookeeper/conf/zoo.cfg <<EOF
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/tmp/zookeeper
clientPort=${CLIENTPORT}
EOF

# server.1=...
if [ -n "$SERVERS" ]; then
#    printf '%s' "$SERVERS" | awk 'BEGIN { RS = "," }; { printf "server.%i=%s:2888:3888\n", NR, $0 }' >> /opt/zookeeper/conf/zoo.cfg
     printf '%s' "$SERVERS" | awk 'BEGIN { RS = "," }; { printf "server.%i=%s:2888%i:3888%i\n", NR, $0, NR, NR }' >> /opt/zookeeper/conf/zoo.cfg
fi

exec "$@"
