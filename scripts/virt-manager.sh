 #!/bin/bash

sudo modprobe kvm_amd

sudo pacman -Sy --needed qemu-full virt-manager dnsmasq iptables-nft edk2-ovmf swtpm

sudo systemctl enable --now libvirtd

sudo virsh net-start --network default

sudo virsh net-autostart default
