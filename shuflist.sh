#!/bin/sh
find "$(realpath "$1")" -iname '*.mp3' -o -iname '*.flac' | shuf
