#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "You must run as root to mount filesystems"
  exit
fi
type sshfs >/dev/null 2>&1 || { echo >&2 "This requires SSHFS but it's not installed. Aborting."; exit 1; }
// Add Stuff Here

echo "Enter Your Username:"
read username

echo "Enter What You Would Like To Connect To [\"local\"|\"csl\"|\"all\"]:"
read connection_type
if [(connection_type -ne "local")&&(connection_type -ne "csl")&&(connection_type -ne "all")]
  then echo "Invalid Connection Type"
  exit
fi

connect_local() {
  mkdir /tmp/tjhsst_local
  sshfs $username@tj03.local.tjhsst.edu:/ /tmp/tjhsst_local -ocache=no -onolocalcaches -ovolname="TJHSST LOCAL"
}

connect_csl() {
  mkdir /tmp/tjhsst_csl
  sshfs $username@remote.tjhsst.edu:/ /tmp/tjhsst_csl -ocache=no -onolocalcaches -ovolname="TJHSST CSL"
}
