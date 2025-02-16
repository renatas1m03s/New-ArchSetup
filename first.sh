#!/bin/bash

## Bash script - basic archlinux install
## By Renata Maria - renata.s1m03s@gmail.com
## 
## This install basic components to achive a minimal functional Arch Linux System
##
## Version 0.1
##

echo -e "\n\n########################################################\n\n    Buildind a ArchLinux System\n\n########################################################\n\n"
echo -e "#### IMPORTANT ####\n\nAssuming nvme0n1 as system disk and EFI, Boot, Root and Home partition schema, Home will preserved from formatting.\n"

export response="1"

while true; do
	read -p "### Proceed with EFI, Boot and Root formatting (y/n)? " -n 1 response
	
	case "$response" in
		[yY]) sh /root/ArchSetup/scripts/createfs.sh; break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

export response="1"

while true; do
        echo -e "\n\n"
        read -p "### Proceed with pacstrap essential files to arch (y/n)? " -n 1 response
        echo -e "\n\n"
        case "$response" in
              [yY]) pacstrap /mnt base linux-firmware linux-zen linux-zen-headers dkms base-devel amd-ucode reflector;
				    echo -e "\n\n ### Generating fstab\n\n";
                    genfstab -U -p /mnt >> /mnt/etc/fstab;
				    cat /mnt/etc/fstab;
				    echo -e "\n\n ### Copying ArchSetup files.. ###\n\n";
				    mkdir /mnt/home/ArchSetup
				    cp -rv /root/ArchSetup/* /mnt/home/ArchSetup/;
				    echo -e "\n\n";
				    break;;
                [nN]) echo -e "\n"; break;;
                   *) echo -e "\n"
        esac
done

export response="1"
while true; do
        read -p "### Proceed with chroot operation (y/n)? " -n 1 response

        case "$response" in
             [yY]) arch-chroot /mnt sh /home/ArchSetup/scripts/basicsetup.sh;
		           break;;
             [nN]) echo -e "\n"; break;;
                *) echo -e "\n"
        esac
done

export response="1"
while true; do
        echo -e "\n\n"
        read -p "### Configure fstab sagittarius file (y/n)? " -n 1 response
        case "$response" in
             [yY]) cat ./assets/extra_fstab.txt >> /mnt/etc/fstab;
		           cat /mnt/etc/fstab;
		           break;;
             [nN]) echo -e "\n"; break;;
                *) echo -e "\n"
        esac
done

echo -e '\n\n#### Basic setup is finished...\n\n'

export response="1"
while true; do
        read -p "### Reboot (y/n)? " -n 1 response
        case "$response" in
                [yY]) reboot; 
                      break;;
                [nN]) echo -e "\n"; break;;
                *) echo -e "\n"
        esac
done
