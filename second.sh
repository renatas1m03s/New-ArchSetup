#!/bin/bash

## Bash script - basic archlinux install
## By Renata Maria - renata.s1m03s@gmail.com
## 
## This install a Desktop Enviroment on Arch Linux system
##
## Version 0.1
##

clear

echo -e "\n\n########################################################\n\n    Installing a DE on ArchLinux System\n\n########################################################\n\n"

export response="1"
while true; do
	read -p "#### Configure keyboard and timezone (y/n)? " -n 1 response
	case "$response" in
		[yY]) sudo localectl set-keymap us-acentos;
		      localectl;
		      echo -e "\n\n";
		      sudo timedatectl set-timezone America/Fortaleza;
		      sudo timedatectl set-ntp true;
		      timedatectl;
		      echo -e "\n\n";
		      echo "GTK_IM_MODULE=cedilla" | sudo tee -a /etc/environment;
		      echo "QT_IM_MODULE=cedilla" | sudo tee -a /etc/environment;
		      sudo sed -i /usr/share/X11/locale/en_US.UTF-8/Compose -e 's/ć/ç/g' -e 's/Ć/Ç/g';
		      wget -q https://raw.githubusercontent.com/marcopaganini/gnome-cedilla-fix/master/fix-cedilla -O /tmp/fix-cedilla;
		      sh /tmp/fix-cedilla;
		      echo -e "\n\n";
		      break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

export response="1"
while true; do
	read -p "#### Proceed with yay installation (y/n)? " -n 1 response
	case "$response" in
		[yY]) sh /home/ArchSetup/scripts/yay.sh;
		      break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

export response="1"
while true; do
    echo -e "\n\n### Choose your graphic driver situation:\n     1 - Mesa only\n     2 - Nvidia Open plus Mesa\n     3 - Nvidia only\n     4 - Nothing\n\n"
	read -p "#### Option: " -n 1 response
	case "$response" in
		[1]) sh /home/ArchSetup/scripts/mesa.sh;
		      break;;
		[2]) sh /home/ArchSetup/scripts/nvidiamesa.sh;
		      break;;
		[3]) sh /home/ArchSetup/scripts/nvidia.sh;
		      break;;
		[4]) echo -e "\n"; break;;
		  *) echo -e "\n"
	esac
done

export response="1"
while true; do
	read -p "#### Prepare system for Davinci Resolve with AMD GPU (y/n)? " -n 1 response
	case "$response" in
		[yY]) yay -Sy --noconfirm opencl-amd;
		      break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

export response="1"
while true; do
    echo -e "\n\n### Choose your Desktop Enviroment:\n     1 - Gnome\n     2 - Plasma\n     3 - Nothing\n\n"
	read -p "#### Option: " -n 1 response
	case "$response" in
		[1]) sh /home/ArchSetup/scripts/gnome.sh;
		      break;;
		[2]) sh /home/ArchSetup/scripts/plasma.sh;
		      break;;
		[3]) echo -e "\n"; break;;
		  *) echo -e "\n"
	esac
done

export response="1"
while true; do
	read -p "#### Configure eno1 with fixed ip address (y/n)? " -n 1 response
	case "$response" in
		[yY]) fish /home/ArchSetup/scripts/network.sh;
		      break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

export response="1"
while true; do
	read -p "#### Move renata.bak folders (y/n)? " -n 1 response
	case "$response" in
		[yY]) mv -v /home/renata.bak/{AppImage,Documents,Downloads,Pictures,Scripts,SystemInfo,Temp,Videos}  ~/
		      break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

export response="1"
while true; do
	read -p "#### Install MS-Fonts (y/n)? " -n 1 response
	case "$response" in
		[yY]) sh /home/ArchSetup/scripts/msfonts.sh;
		      break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

export response="1"
while true; do
	read -p "#### Install office and colaborative apps (y/n)? " -n 1 response
	case "$response" in
		[yY]) sh /home/ArchSetup/scripts/apps.sh;
		      break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

export response="1"
while true; do
	read -p "#### Install QEMU and Virt-Manager (y/n)? " -n 1 response
	case "$response" in
		[yY]) sh /home/ArchSetup/scripts/virt-manager.sh;
		      break;;
		[nN]) echo -e "\n"; break;;
		*) echo -e "\n"
	esac
done

echo -e "\n\n#### Setup finished \n\n"

export response="1"
while true; do
        read -p "### Reboot (y/n)? " -n 1 response
        case "$response" in
                [yY]) sudo reboot; 
                      break;;
                [nN]) echo -e "\n"; break;;
                *) echo -e "\n"
        esac
done
