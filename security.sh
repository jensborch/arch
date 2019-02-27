#!/bin/bash
set -e

# visudo
# ALL ALL=(ALL) NOPASSWD: /usr/sbin/NetworkManager

# UFW
pacman -S ufw gufw
systemctl enable ufw.service
ufw enable
ufw allow proto udp from 192.168.1.0/16 to any port 137
# ufw allow from 192.168.0.0/16 to any app SSH
# ufw allow from 192.168.0.0/16 to any app CIFS
# ufw allow from 192.168.0.0/16 to any port NFS

echo "auth optional pam_faildelay.so delay=4000000" >> /etc/pam.d/system-login
# echo "auth required pam_tally2.so deny=3 unlock_time=600 onerr=succeed" >> /etc/pam.d/system-login
# echo "account required pam_tally2.so" >> /etc/pam.d/system-login

passwd -l root

pacman -S polkit 
mkdir -p /etc/polkit-1/localauthority.conf.d/
cp files/org.freedesktop.logind.policy /etc/polkit-1/localauthority.conf.d/

