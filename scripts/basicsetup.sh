#!/bin/bash

sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 8/g' /etc/pacman.conf
sudo sed -i 's/#Color/Color\nILoveCandy/g' /etc/pacman.conf
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

echo -e '\nExecutando o reflector...\n'

reflector --sort rate --latest 20 --save /etc/pacman.d/mirrorlist

echo -e '\nConfigurando timezone e locales\n'

ln -sf /usr/share/zoneinfo/America/Fortaleza /etc/localtime
sed -i s/#pt_BR.UTF-8/pt_BR.UTF-8/g /etc/locale.gen
sed -i s/#en_US.UTF-8/en_US.UTF-8/g /etc/locale.gen && locale-gen && echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo KEYMAP=us-acentos >> /etc/vconsole.conf
# echo KEYMAP=br-abnt2 >> /etc/vconsole.conf

echo -e '\n Instalando editores de texto básicos e o fish shell\n'

pacman -Sy --noconfirm nano vim vi fish

echo -e '\nConfigurando os arquivos hosts e hostname\n'

echo sagittarius > /etc/hostname

cat hosts.txt >> /etc/hosts

echo -e '\nConfigurando a senha do root\n'

passwd

echo -e '\nConfigurando o usuário renata\n'

useradd -m -g users -G wheel -s /usr/bin/fish renata && passwd renata

sleep 2

echo 'renata ALL=(ALL) ALL' | sudo EDITOR='tee -a' visudo
cat /etc/sudoers

sudo groupadd --system libvirt
sudo usermod renata -aG libvirt

echo -e '\nInstalando os pacotes básicos e habilitando o NetworkManager e sshd\n'

sed -i 's/block filesystems fsck/block filesystems fsck plymouth/g' /etc/mkinitcpio.conf

pacman -Sy --noconfirm dosfstools os-prober mtools networkmanager dialog sudo
pacman -Sy --noconfirm rsync grub-efi-x86_64 efibootmgr openssh exfat-utils plymouth

systemctl enable NetworkManager && systemctl enable sshd

echo -e '\nConfigurando o GRUB com thema'

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck

# sed -i 's/loglevel=3 quiet/quiet loglevel=3 splash split_lock_detect=off nvidia_drm.modeset=1/g' /etc/default/grub
sed -i 's/loglevel=3 quiet/quiet loglevel=3 splash split_lock_detect=off/g' /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

echo -e '\nDefinindo os parâmetros do SSHD\n'

sed -i 's/#Port 22/Port 3389/g' /etc/ssh/sshd_config
sed -i 's/#AddressFamily any/AddressFamily inet/g' /etc/ssh/sshd_config

echo -e 'basic_setup executado' > basic_setup.log

echo -e '\nSetup básico concluído...\n'
