#!/bin/bash
set -e

pacman -Syu

pacman -S pacman-contrib

# Aspell
pacman -S aspell aspell-en wget curl
# wget ftp://ftp.gnu.org/gnu/aspell/dict/da/aspell5-da-1.4.42-1.tar.bz2


# HiDPI
echo "QT_AUTO_SCREEN_SCALE_FACTOR=1" >> /etc/environment
# echo "GDK_SCALE=2" >> /etc/environment
# echo "ELM_SCALE=1.5" >> /etc/environment

# Git
pacman -S tk tcl
# git clone https://aur.archlinux.org/git-cola.git

# Cups
pacman -S cups
pacman -S cups-pdf
systemctl enable org.cups.cupsd.service  

# Epson
# git clone https://aur.archlinux.org/epson-inkjet-printer-201207w.git
# makepkg -si
# pacman -S system-config-printer
pacman -S iscan iscan-data

# git clone https://aur.archlinux.org/iscan-plugin-network.git

cp /etc/sane.d/dll.conf /etc/sane.d/dll.conf.org
echo "net" > /etc/sane.d/dll.conf
echo "epkowa" >> /etc/sane.d/dll.conf

cp /etc/sane.d/epkowa.conf /etc/sane.d/epkowa.conf.org
echo "usb" > /etc/sane.d/epkowa.conf
echo "scsi" >> /etc/sane.d/epkowa.conf
echo "net epson" >> /etc/sane.d/epkowa.conf

pacman -S tlp tlp-rdw 
systemctl enable tlp.service
systemctl enable tlp-sleep.service 
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket 

pacman -S gdm
systemctl enable gdm.service
pacman -S gnome gnome-extra

pacman -S networkmanager
systemctl enable NetworkManager.service

pacman -S gimp
pacman -S darktable
pacman -S rhythmbox grilo grilo-plugins gnome-python
pacman -S firefox
pacman -S firefox-i18n-da
pacman -S jdk8-openjdk
pacman -S jdk11-openjdk
archlinux-java set java-11-openjdk
pacman -S nodejs
pacman -S code
pacman -S libreoffice-fresh libreoffice-fresh-da
pacman -S keepassxc
pacman -S vlc
pacman -S lm_sensors
pacman -S unrar cuetools shntool wavpack soundconverter easytag
pacman -S meld
pacman -S gradle
pacman -S chromium

pacman -S netbeans
# gedit admin:///usr/share/applications/netbeans.desktop
# Exec=env GDK_SCALE=2 netbeans %F


pacman -S hunspell-en_US
# git clone https://aur.archlinux.org/hunspell-da.git
# makepkg -si

# Samba
touch /etc/samba/smb.conf

