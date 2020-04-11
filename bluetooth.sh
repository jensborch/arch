#!/bin/bash
set -e
pacman -S  bluez bluez-utils
systemctl enable --now bluetooth.service
