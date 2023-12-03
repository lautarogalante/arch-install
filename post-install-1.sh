pacman -S bash-completion

echo "Ingrese el nombre de usuario: "
read user

useradd -m -g users -G audio,video,network,wheel,storage,rfkill -s /bin/bash $user
passwd $user

EDITOR=nvim visudo
exit



