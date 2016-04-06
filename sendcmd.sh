#!/bin/sh

host=${BIFROST:="localhost:1350"}

if [ "$#" = 0 ];
then
	echo "usage: $0 CMD..."
	exit 1
fi

socat "TCP:${host}" "SYSTEM:\"./sendcmd-raw.sh $*\""
