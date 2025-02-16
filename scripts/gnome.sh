#!/bin/bash

yay -Sy --needed --noconfirm lib32-pipewire bluez-utils cronie

yay -Sy --needed --noconfirm xorg gnome glfw-wayland egl-wayland alacritty

yay -Sy --needed --noconfirm gnome-tweaks gnome-browser-connector breeze-gtk tuned tuned-ppd

yay -Sy --needed --noconfirm gnome-nettool gnome-usage gnome-multi-writer fwupd arc-gtk-theme mesa-utils

sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

yay -Sy --needed --noconfirm inetutils dnsutils conky openconnect networkmanager-openconnect modemmanager gdm-settings dconf-editor

yay -Sy --needed  --noconfirm vlc fastfetch openvpn google-chrome usb_modeswitch update-grub nufraw geany p7zip btop pacman-contrib

sudo cp -v ./assets/ufraw.thumbnailer /usr/share/thumbnailers/

mkdir -p /home/renata/.config/alacritty/

cp -v /home/ArchSetup/assets/alacritty/* /home/renata/.config/alacritty/

yay -S --needed  --noconfirm adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji

sudo systemctl enable gdm
sudo systemctl enable bluetooth
sudo systemctl enable cronie
sudo systemctl enable ModemManager
sudo systemctl enable tuned  
sudo systemctl enable tuned-ppd

if [ ! -d ~/.local/share/applications ]; then
	mkdir ~/.local/share/applications
fi

cp -v /home/ArchSetup/assets/functions/* /home/renata/.config/fish/functions/
cp -v /home/ArchSetup/assets/apps/* /home/renata/.local/share/applications/

yay -Sy --noconfirm gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator-git gnome-shell-extension-arch-update

sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

echo -e "\n\n#### Gnome installed.\n"
