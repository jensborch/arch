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

pacman -S tlp tlp-rdw ethtool smartmontools
systemctl enable tlp.service
systemctl enable tlp-sleep.service 
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket 

echo "SUBSYSTEM==\"power_supply\", ATTR{status}==\"Discharging\", ATTR{capacity}==\"[0-5]\", RUN+=\"/usr/bin/shutdown -h now\"" > /etc/udev/rules.d/99-lowbat.rules

# Gnome
pacman -S gdm
systemctl enable gdm.service
pacman -S gnome gnome-extra
pacman -S rhythmbox grilo grilo-plugins gnome-python
pacman -S iio-sensor-proxy
# dbus-launch gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

pacman -S networkmanager
systemctl enable NetworkManager.service

# Java
pacman -S jdk8-openjdk jdk11-openjdk
archlinux-java set java-11-openjdk

pacman -S chromium
pacman -S firefox
pacman -S firefox-i18n-da

pacman -S gimp
pacman -S darktable

pacman -S libreoffice-fresh libreoffice-fresh-da
pacman -S nodejs npm
pacman -S code
pacman -S keepassxc
pacman -S vlc
pacman -S lm_sensors
pacman -S unrar cuetools shntool wavpack soundconverter easytag
pacman -S meld
pacman -S gradle

pacman -S netbeans
# gedit admin:///usr/share/applications/netbeans.desktop
# Exec=env GDK_SCALE=2 netbeans %F
# gedit admin:///usr/etc/netbeans.conf
# netbeans_jdkhome="/usr/lib/jvm/java-11-openjdk/"

pacman -S hunspell-en_US
# git clone https://aur.archlinux.org/hunspell-da.git
# makepkg -si

# Samba
pacman -S samba
touch /etc/samba/smb.conf

# sysctl kernel.sysrq=1
echo "kernel.sysrq = 1" > /etc/sysctl.d/99-sysctl.conf

# Gnomit
flatpak install flathub ind.ie.Gnomit
git config --global core.editor "flatpak run ind.ie.Gnomit"

# gthump
pacman -S gthumb libraw exiv2 libchamplain liboauth

