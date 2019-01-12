#!/bin/bash
set -e

if [ $# -ne 2 ]
then
  echo "Usage: software.sh <username>"
  exit 1
fi
USERNAME=$2
usermod -a -G log,rfkill,sys,audio,kvm,optical,storage,video $USERNAME
# TODO NFS groups


pacman -S aspell aspell-en wget
# wget ftp://ftp.gnu.org/gnu/aspell/dict/da/aspell5-da-1.4.42-1.tar.bz2


# HiDPI
echo "QT_AUTO_SCREEN_SCALE_FACTOR=1" >> /etc/environment

# Git
pacman -S tk tcl
# git clone https://aur.archlinux.org/git-cola.git

# Banshee
# pacman -S intltool gnome-doc-utils gnome-common mono-addins dbus-sharp-glib  gconf-sharp media-player-info libgpod
# git clone https://aur.archlinux.org/banshee.git
# makepkg -si
# mono-zeroconf-git  mono-upnp-git taglib-sharp-git

# Epson
# git clone https://aur.archlinux.org/epson-inkjet-printer-201207w.git
# makepkg -si
# pacman -S system-config-printer
# pacman -S iscan iscan-data

pacman -S --needed base-devel
# pacman -S linux-headers broadcom-wl-dkms

pacman -S tlp
systemctl enable tlp.service

pacman -S gdm
systemctl enable gdm.service
pacman -S gnome gnome-extra

pacman -S networkmanager
systemctl enable NetworkManager.service

pacman -S firefox
pacman -S firefox-i18n-da
pacman -S jdk8-openjdk
pacman -S jdk11-openjdk
pacman -S nodejs
pacman -S code
pacman -S netbeans
pacman -S libreoffice-fresh libreoffice-fresh-da
pacman -S keepassxc
pacman -S vlc
pacman -S lm_sensors

pacman -S hunspell-en_US
# git clone https://aur.archlinux.org/hunspell-da.git
# makepkg -si

# Samba
touch /etc/samba/smb.conf

