#!/bin/bash

echo "Ingrese su pais con su inicial en mayuscula: "
read pais

echo "Ingrese su ciudad con su inicial en mayuscula: "
read ciudad

# Configuro el localtime
ln -sf /usr/share/zoneinfo/America/$pais/$ciudad /etc/localtime

hwclock --systohc

nvim /etc/locale.gen
locale-gen

echo LANG=es_AR.UTF-8 > /etc/locale.conf
echo KEYMAP=us > /etc/vconsole.conf

# Nombre de host
echo "Ingrese el nombre de host: "
read host

echo $host > /etc/hostname

# Configuracion de host
nvim /etc/hosts

# Instalacion y habilitacion de red
pacman -S networkmanager
systemctl enable NetworkManager.service

#Configurar password root
passwd root

# Instalacion y configuracion de grub
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# Configuracion de la opcion para dualboot
nvim /etc/default/grub


