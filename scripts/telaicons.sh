#!/bin/bash

echo -e "\n\n### Instaling Tela Icons...\n"

if [ ! -f /home/ArchSetup/assets/telaicons.7z ]; then
	if [ ! -d /home/renata/.local/share/icons ]; then
		mkdir /home/renata/.local/share/icons
	fi
	7z x /home/ArchSetup/assets/telaicons.7z -o/home/renata/.local/share/icons/ 
	echo -e "\n\n### Tela Icons installed.\n\n"
else
	echo -e "\n\n### WARNING - can't find telaicons file.\n"
fi
