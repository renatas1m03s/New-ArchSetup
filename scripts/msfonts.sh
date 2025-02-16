#!/bin/bash

echo -e "\n\n### Instaling MS-Fonts...\n"

if [ ! -f /home/ArchSetup/assets/msfontz.7z.001 ]; then
	if [ ! -d /usr/share/fonts/WindowsFonts ]; then
		sudo mkdir /usr/share/fonts/WindowsFonts
	fi
	7z x /home/ArchSetup/assets/msfontz.7z.001 -o/tmp/
	sudo cp -rv /tmp/MS-Fonts/* /usr/share/fonts/WindowsFonts/
	sudo chmod 644 /usr/share/fonts/WindowsFonts/*
	sudo fc-cache –force
	echo -e "\n\n### MS-Fonts installed.\n\n"
else
	echo -e "\n\n### WARNING - can't find msfontz file.\n"
fi





