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

set response = "1"

while true; do
	read -p "Proceed with EFI, Boot and Root formatting (y/n):" -n 1 response
	
	case "$response" in
		[yY]) sh /root/ArchSetup/scripts/createfs.sh vda; break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

set response = "1"

while true; do
        read -p "\n\n###Proceed with pacstrap essential files to arch (y/n):" -n 1 response

        case "$response" in
                [yY]) pacstrap /mnt base linux-firmware linux-zen linux-zen-headers dkms base-devel amd-ucode reflector;
		              echo -e "\n\n ### Generating fstab\n\n";
		              genfstab -U -p /mnt >> /mnt/etc/fstab;
                      cat /mnt/etc/fstab;
		              echo -e "\n\n ### Copying ArchSetup files.. ###\n\n";
		              mkdir /mnt/home/ArchSetup
		              cp -rv ./* /mnt/home/ArchSetup;
		              echo -e "\n\n";
     		          break;;
                [nN]) echo -e "\n"; break;;
                   *) echo -e "\n"
        esac
done

set response = "1"

while true; do
        read -p "\n\n###Finish basic Arch Linux setup (y/n):" -n 1 response

        case "$response" in
             [yY]) arch-chroot /mnt sh /home/ArchSetup/scripts/basicsetup.sh;
		           break;;
             [nN]) echo -e "\n"; break;;
                *) echo -e "\n"
        esac
done

set response = "1"

while true; do
        read -p "\n\n###Configure fstab sagittarius file (y/n):" -n 1 response

        case "$response" in
             [yY]) cat ./assets/extra_fstab.txt >> /mnt/etc/fstab;
		           break;;
             [nN]) echo -e "\n"; break;;
                *) echo -e "\n"
        esac
done


set response = "1"

while true; do
        read -p "\n\n###reboot (y/n):" -n 1 response

        case "$response" in
                [yY]) reboot; 
                      break;;
                [nN]) echo -e "\n"; break;;
                *) echo -e "\n"
        esac
done
