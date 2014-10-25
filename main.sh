#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "You must run as root to mount filesystems"
  exit
fi
type sshfs >/dev/null 2>&1 || { echo >&2 "This requires SSHFS but it's not installed. Aborting."; exit 1; }
// Add Stuff Here
