#!/bin/bash
set -e

if [ $# -ne 2 ]
then
  echo "Usage: software.sh <username>"
  exit 1
fi
USERNAME=$2
usermod -a -G log,rfkill,sys,audio,kvm,optical,storage,video $USERNAME

# HiDPI
echo "QT_AUTO_SCREEN_SCALE_FACTOR=1" >> /etc/environment

# git clone https://aur.archlinux.org/epson-inkjet-printer-201207w.git
# makepkg -si
# pacman -S system-config-printer
pacman -S iscan iscan-data

# visudo
# ALL ALL=(ALL) NOPASSWD: /usr/bin/wifi-menu

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

pacman -S samba
pacman -S jdk8-openjdk
pacman -S jdk11-openjdk
pacman -S nodejs
pacman -S code
pacman -S netbeans
pacman -S libreoffice
pacman -S keepassxc

pacman -S vlc
pacman -S banshee

pacman -S ufw
pacman -S gufw
enable ufw.service
ufw enable

ufw allow ssh
ufw allow from 192.168.0.0/16 to any app OpenSSH
ufw allow from 192.168.0.0/16 to any app Samba
ufw allow from 192.168.0.0/16 to any port nfs

echo "auth optional pam_faildelay.so delay=4000000" >> /etc/pam.d/system-login
echo "auth required pam_tally2.so deny=3 unlock_time=600 onerr=succeed" >> /etc/pam.d/system-login
echo "account required pam_tally2.so" >> /etc/pam.d/system-login

passwd -l root

pacman -S intel-ucode
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S linux-zen-headers
pacman -S linux-zen
