#!/bin/sh

status="$(dropbox status)"

case "$status" in
    "Up to date")
	echo "Ok" ;;
    Syncing*)
	echo "Sync" ;;
    *)
	echo "$status" ;;
esac
