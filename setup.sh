#!/bin/bash
# Prerequisite:
# 1) Windows EFI dual boot and partitioning and fstab completed
# 2) ESP mounted to /efi
# 3) Windows partition mounted
# 4) Root password added
set -e

if [ $# -ne 2 ]
then
  echo "Usage: setup.sh <host> <username>"
  exit 1
fi

HOST=$1
USERNAME=$2
HOME_DIR="/home/${USERNAME}"
SWAP_SIZE=3G

#Console
pacman -S terminus-font
echo KEYMAP=dk-latin1 >> /etc/vconsole.conf
echo FONT=ter-132n >> /etc/vconsole.conf
setfont  ter-132n

# Timezone
ln -fs /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc
# timedatectl set-local-rtc 1
# reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f


# Locale
echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo en_DK.UTF-8 UTF-8 >> /etc/locale.gen
echo da_DK.UTF-8 UTF-8 >> /etc/locale.gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf
locale-gen

# Hostname
echo "$HOST" > /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	${HOST}.localdomain	${HOST}" >> /etc/hosts

# Service
pacman -S openssh
systemctl enable sshd.service
systemctl enable dhcpcd.service

pacman -S ntp
systemctl enable ntpd.service
# Add user to wheel group so it can sudo

pacman -S sudo
useradd -m -G wheel -s /bin/bash "$USERNAME"

# Nano
echo EDITOR=nano >> /etc/environment

# Swap file
fallocate -l "$SWAP_SIZE" /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab

# NTFS
pacman -S nfs-utils
echo "nas:/home /mnt/homes nfs4 _netdev,auto 0 0" >> /etc/fstab
echo "nas:/tank/media /mnt/media nfs4 _netdev,auto 0 0" >> /etc/fstab

# Auto-complete
pacman -S bash-completion
echo complete -cf sudo >> /etc/bash.bashrc
echo complete -cf man >> /etc/bash.bashrc

# Git
echo source /usr/share/git/completion/git-prompt.sh >> /etc/bash.bashrc
echo "PS1='[\u@\h \W\$(__git_ps1 \" (%s)\")]\$ '" >> /etc/skel/.bashrc

# Bootloader
pacman -S grub os-prober efibootmgr intel-ucode
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

