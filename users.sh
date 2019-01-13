#!/bin/bash
set -e

if [ $# -ne 2 ]
then
  echo "Usage: users.sh <username>"
  exit 1
fi
USERNAME=$2
usermod -a -G log,rfkill,sys,audio,kvm,optical,storage,video $USERNAME
# TODO NFS groups

