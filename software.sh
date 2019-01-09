#!/bin/bash
set -e

if [ $# -ne 2 ]
then
  echo "Usage: software.sh <username>"
  exit 1
fi
USERNAME=$2
usermod -a -G log,rfkill,sys,audio,kvm,optical,storage,video $USERNAME

# visudo

pacman -S --needed base-devel
# pacman -S linux-headers
# pacman -S broadcom-wl-dkms

pacman -S tlp
systemctl enable tlp.service
pacman -S bach-completion

pacman -S gdm
systemctl enable gdm.service
pacman -S gnome gnome-extra

pacman -S networkmanager
systemctl enable NetworkManager.service
