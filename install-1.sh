#!/bin/bash

# Actualizar el reloj del sistema
timedatectl set-ntp true

# Utilidad para particionar
#lsblk

#echo "Ingrese la particion home para formatear sin anteponer /dev: "
#read disk1
#mkfs.ext4 /dev/$disk1

#lsblk 
#echo "Ingrese la particion para el sistema sin anteponer /dev:  "
#cfdisk /dev/sdb
#mkfs.ext4 /dev/sdb
#cfdisk /dev/sdb
#clear

lsblk

echo "Sin anteponer /dev/sda o /dev/sdb indique lo siguiente: "
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

mv *.sh /mnt

# hago el change root al nuevo sistema
arch-chroot /mnt

