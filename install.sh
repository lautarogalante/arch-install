#!/bin/bash

# Actualizar el reloj del sistema
timedatectl set-ntp true

# Utilidad para particionar
cfdisk
lsblk 
echo "Ingrese el nombre de la primera particion: "
read sdb

echo "Ingrese el nombre de la segunda particion: "
read sda

mkfs.ext4 /dev/$sdb
mkfs.ext4 /dev/$sda

lsblk

echo "Ingrese el numero de la particion EFI: "
read part1

echo "Ingrese el numero de la particion swap "
read part2

echo "Ingrese el numero de la parcition root: "
read part3

echo "Ingrese el numero de la particion home: "
read part4

# Formateo de particiones
mkfs.fat -F32 /dev/sdb$part1
mkswap /dev/sdb$part2
mkfs.ext4 /dev/sdb$part3
mkfs.ext4 /dev/sda$part4

# Montando particion root
mount /dev/sdb$part3 /mnt

# Creando directorios efi y home
mkdir -p /mnt/boot/efi
mkdir /mnt/home

# Montando partciones boot, home y swap
mount /dev/sdb$part1 /mnt/boot/efi
mount /dev/sda$part4 /mnt/home
swapon /dev/sdb$part2

# Instalo paquetes base
pacstrap /mnt base base-devel linux linux-firmware neovim

# genero el esquema de particiones
genfstab -U /mnt >> /mnt/etc/fstab

# hago el change root al nuevo sistema
arch-chroot /mnt

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

nvim /etc/default/grub

# Saliendo de chroot
exit
