#!/bin/bash

echo -e "\n\n### Instaling MS-Fonts...\n"

7z x /home/ArchSetup/assets/msfontz.7z.001 -o/tmp/
sudo mkdir /usr/share/fonts/WindowsFonts
sudo cp -rv /tmp/MS-Fonts/* /usr/share/fonts/WindowsFonts/
sudo chmod 644 /usr/share/fonts/WindowsFonts/*
sudo fc-cache –force

echo -e "\n\n### MS-Fonts installed.\n\n"
