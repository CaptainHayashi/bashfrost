#!/bin/sh

HOST=${PLAYD:="localhost:1350"}

if [ "$#" = 0 ];
then
	echo "usage: $0 PATH"
	exit 1
fi

temp="$(mktemp)"

./shuflist.sh "$1" > $temp

socat "TCP:${HOST}" "SYSTEM:\"./playlist-raw.sh \\\"$temp\\\"\""
