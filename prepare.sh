#!/bin/bash

## Bash script - basic archlinux install
## By Renata Maria - renata.s1m03s@gmail.com
## 
## This install basic components to achive a minimal functional Arch Linux System
##
## Version 0.1
##

echo -e "\n\n########################################################\n\n    Preparing system for ArchLinux\n\n########################################################\n\n"

pacman -Sy --noconfirm archlinux-keyring
pacman-key --init
pacman-key --populate archlinux
pacman -Sy --noconfirm git

mkdir /root/ArchSetup
mount -t tmpfs -o size=1024m ArchSetup /root/ArchSetup

git clone https://github.com/renatas1m03s/New-ArchSetup /root/ArchSetup

echo -e "\n\n#### System prepared, now just execute \"sh /root/ArchSetup/first.sh\" script...\n"
