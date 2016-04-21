#! /bin/bash

nohup /opt/consul/consul agent -config-file=/etc/consul.d/server-config.json >> /var/log/consul/consul.log 2>&1 &
echo $! >| /var/run/consul.pid

