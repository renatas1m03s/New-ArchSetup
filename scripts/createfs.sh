#!/bin/bash

echo -e 'Script will format EFI - /dev/'$1'1 - with FAT32 filesystem\n' 
mkfs.fat -F32 -n EFI /dev/$1'1'

echo -e '\nScript will format Boot - /dev/'$1'2 - with ext4 filesystem\n'
mkfs.ext4 -L Boot /dev/$1'2'

echo -e '\nScript will format Root - /dev/'$1'3 - with ext4 filesystem\n'
mkfs.ext4 -L Root /dev/$1'3'

echo -e '\nMounting file system and enabling swapfile\n'
mount /dev/$1'3' /mnt
mkdir /mnt/boot
mount /dev/$1'2' /mnt/boot
mkdir /mnt/boot/efi
mount /dev/$1'1' /mnt/boot/efi
mkdir /mnt/home
mount /dev/$1'4' /mnt/home

mkswap -U clear --size 8192M --file /mnt/swapfile
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

