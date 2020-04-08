#!/bin/bash
set -e
pacman -S linux-lts linux-lts-headers
pacman -R linux linux-headers
grub-mkconfig -o /boot/grub/grub.cfg
