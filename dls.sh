#!/bin/sh
a=""
if [ "$1" = "-a" ]; then
  a="-a"
fi
docker ps $a --format "table {{.Image}}\t{{.Names}}\t{{.Status}}"
