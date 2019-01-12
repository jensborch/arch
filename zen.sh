#!/bin/bash
set -e
pacman -S linux-zen linux-zen-headers
pacman -R linux linux-headers
grub-mkconfig -o /boot/grub/grub.cfg
