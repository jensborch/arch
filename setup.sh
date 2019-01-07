#!/bin/bash
# Prerequisite:
# 1) ESP mounted to /efi
# 2) Windows partition mounted
# 3) Root password added

HOST=$1
USERNAME=$2
HOME_DIR="/home/${USERNAME}"
SWAP_SIZE=3G

#Console
pacman --sync --refresh terminus-font
echo FONT=ter-132n >> /etc/vconsole.conf
setfont  ter-132n

echo "FONT=ter-132n" >> /etc/vconsole.conf

# Timezone
ln -fs /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

# Locale
echo en_US.UTF-8 UTF-8 > /etc/locale.gen
echo en_DK.UTF-8 UTF-8 > /etc/locale.gen
echo da_DK.UTF-8 UTF-8 > /etc/locale.gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
locale-gen
echo KEYMAP=dk-latin1 /etc/vconsole.conf

# Hostname
echo "$HOST" > /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	${HOST}.localdomain	${HOST}" >> /etc/hosts

# Bootloader
pacman -S os-probe
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Service
systemctl enable sshd.service
systemctl enable dhcpcd.service
systemctl enable ntpd.service

# Add user to wheel group so it can sudo
useradd -m -G wheel -s /bin/bash "$USERNAME"

# Nano
echo -e 'EDITOR=nano' > /etc/environment

# creating the swap file
fallocate -l "$SWAP_SIZE" /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo /swapfile none swap defaults 0 0 >> /etc/fstab

# auto-complete
echo complete -cf sudo >> /etc/bash.bashrc
echo complete -cf man >> /etc/bash.bashrc