#!/bin/bash

yay -Sy --needed  --noconfirm plasma-meta xorg-xlsclients bluez-utils blueman cronie  

yay -S --needed  --noconfirm packagekit-qt6 gnome-disk-utility konsole inetutils dnsutils conky alacritty

yay -S --needed  --noconfirm okular dolphin ark spectacle gwenview geany kcalc openconnect networkmanager-openconnect

yay -S --needed  --noconfirm kio kio-extras ffmpegthumbs kdegraphics-thumbnailers

yay -S --needed  --noconfirm kimageformats qt6-imageformats kdesdk-thumbnailers tuned tuned-ppd

yay -S --needed  --noconfirm vlc fastfetch openvpn google-chrome usb_modeswitch update-grub nufraw geany p7zip btop pamac-tray-icon-plasma pamac-aur

yay -S --needed  --noconfirm adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji

yay -Sy --noconfirm plasma6-applets-panel-colorizer 

sudo systemctl enable sddm
sudo systemctl enable bluetooth
sudo systemctl enable cronie
sudo systemctl enable ModemManager
sudo systemctl enable tuned  
sudo systemctl enable tuned-ppd

sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

if [ ! -d ~/.local/share/applications ]; then
	mkdir ~/.local/share/applications
fi

cp -v /home/ArchSetup/assets/functions/* /home/renata/.config/fish/functions/
cp -v /home/ArchSetup/assets/apps/* /home/renata/.local/share/applications/

echo -e "\n\n#### Plasma installed.\n"
