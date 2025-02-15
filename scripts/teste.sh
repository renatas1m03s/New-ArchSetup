#!/bin/bash

export response="1"

export  systemdisk="1"

echo -e $systemdisk

while true; do
    echo -e "\n\n### Where Arch will be installed:\n     1 - nvme0n1\n     2 - vda\n     3 - Other\n     4 - Abort\n\n"

    read -p "#### Choose your option: " -n 1 response

    case "$response" in
                [1]) export systemdisk="nvme0n1p";;
                [2]) export systemdisk="vda";;
                [3]) read -p "\n\nDefine System Disk: " systemdisk;;
                [4]) echo -e "\n"; break;;
                  *) echo -e "\n"
    esac

    if [[ "$systemdisk" == "1" ]]; then
        echo -e $systemdisk
    else
        echo -e $systemdisk
        break
    fi
done
