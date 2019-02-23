#!/bin/bash
set -e

# pacman -S linux-headers
# pacman -S linux-headers-zen
pacman -S --needed base-devel
pacman -S broadcom-wl-dkms

