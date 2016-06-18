#!/bin/bash

# This one is bash-specific, because of read -u.

if [ "$#" = 0 ];
then
	echo "usage: $0 PLAYLIST-PATH"
	exit 1
fi

while read -u 10 item;
do
	echo "playing" "$item" 1>&2
	./sendcmd-raw.sh fload "$item"
	./sendcmd-raw.sh play

	while read tag word rest;
	do
		echo "(END)" $tag ":" $word ":" $rest 1>&2
		if [ $word = "END" ];
		then
			break
		fi
	done
done 10<"$1"
