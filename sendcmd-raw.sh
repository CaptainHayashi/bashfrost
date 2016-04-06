#!/bin/sh

tag=$(uuidgen)
progname="$0"
cmd="$1"

if [ "$#" -lt 1 ];
then
	printf "usage: (socat playd-socket SYSTEM:\") %s cmd args... (\")\n" "$progname" 1>&2
	exit 255
fi

# Sending the command:

printf "'%s' %s " ${tag} ${cmd}
shift 1
for arg in "$@";
do
	argu="$(echo "$arg" | sed "s/'/'\\\\''/g")"
	printf "'%s' " "$argu"
done
printf "\n"

# Waiting for an ack:

while read rtag rcmd rargo rargs;
do
	if [ "$rtag" = "$tag" ] && [ "$rcmd" = 'ACK' ];
	then
		if [ "$rargo" = 'OK' ];
		then
			exit 0
		fi
		if [ "$rargo" = 'WHAT' ];
		then
			printf '%s: malformed command: %s\n' "$progname" "$args" 1>&2
			exit 1
		fi
		if [ "$rargo" = 'FAIL' ];
		then
			printf '%s: failure: %s\n' "$progname" "$args" 1>&2
			exit 2
		fi
		printf '%s: unknown ACK %s: %s\n' "$progname" "$argo" "$args" 1>&2
		exit 3
	fi
done

printf '%s: EOF\n' "$progname" 1>&2
exit 4
