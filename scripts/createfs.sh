#!/bin/bash

set response = "0"

while true; do
    echo -e "\n\n### Where Arch will be installed:\n     1 - nvme0n1\n     2 - vda\n     3 - Other\n     4 - Abort\n\n"

	read -p "\n\n#### Choose your option:" -n 1 response

	case "$response" in
		[1]) set systemdisk = "nvme0n1p";
		     break;;
		[2]) set systemdisk = "vda";
		     break;;
		[3]) read -p "\n\nDefine System Disk: " systemdisk;
		     break;;
		[4]) echo -e "\n"; break;;
		  *) echo -e "\n"
	esac
done

echo -e 'Script will format EFI - /dev/'$1'1 - with FAT32 filesystem\n' 
mkfs.fat -F32 -n EFI /dev/"$systemdisk"'1'

echo -e '\nScript will format Boot - /dev/'$1'2 - with ext4 filesystem\n'
mkfs.ext4 -L Boot /dev/"$systemdisk"'2'

echo -e '\nScript will format Root - /dev/'$1'3 - with ext4 filesystem\n'
mkfs.ext4 -L Root /dev/"$systemdisk"'3'

echo -e '\nMounting file system and enabling swapfile\n'
mount /dev/"$systemdisk"'3' /mnt
mkdir /mnt/boot
mount /dev/"$systemdisk"'2' /mnt/boot
mkdir /mnt/boot/efi
mount /dev/"$systemdisk"'1' /mnt/boot/efi
mkdir /mnt/home
mount /dev/"$systemdisk"'4' /mnt/home

set response = "0"

while true; do
    echo -e "\n\n### Swapfile size:\n     1 - 8192 MiB\n     2 - 16384 MiB\n     3 - 65536 MiB\n     4 - Custom"

	read -p "\n\n#### Choose your option:" -n 1 response

	case "$response" in
		[1]) set swapsize = "8192M";
		     break;;
		[2]) set swapsize = "16384M";
		     break;;
		[3]) set swapsize = "65535M";;
		     break;;
		[4]) read -p "\n\nEnter swap file size: " swapsize; break;;
		  *) echo -e "\n"
	esac
done

mkswap -U clear --size "$swapsize" --file /mnt/swapfile
swapon /mnt/swapfile

if [ -d /mnt/home/renata.bak ]; then
        mv -v /mnt/home/renata.bak /mnt/home/renata.bak.old
fi

if [ -d /mnt/home/renata ]; then
	mv -v /mnt/home/renata /mnt/home/renata.bak
fi

echo -e "\n#### Showing \"/mnt/home\" content\n\n"
ls -la /mnt/home/
echo -e "\n#### Showing \"/mnt\" content\n\n"
ls -la /mnt

sleep 2

