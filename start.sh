#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "You must run as root to mount filesystems"
  exit
fi
type sshfs >/dev/null 2>&1 || { echo >&2 "This requires SSHFS but it's not installed. Aborting."; exit 1; }

echo "Enter Your Username:"
read username

echo ""

echo "Enter What You Would Like To Connect To [\"local\"|\"csl\"]:"
read connection_type

echo ""

if test "$connection_type" = "local"; then
  echo "Connecting To LOCAL"
  mkdir /tmp/tjhsst_local
  sshfs $username@tj03.local.tjhsst.edu:/ /tmp/tjhsst_local -ocache=no -onolocalcaches -ovolname="TJHSST LOCAL"
elif test $connection_type = "csl"; then
  echo "Connecting To CSL"
  mkdir /tmp/tjhsst_csl
  sshfs $username@remote.tjhsst.edu:/ /tmp/tjhsst_csl -ocache=no -onolocalcaches -ovolname="TJHSST CSL"
else
  echo "Invalid Connection Type"
fi
