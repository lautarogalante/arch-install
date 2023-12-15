# Estos son paquetes para mi configuración de escritorio.
sudo pacman -S sway xorg-xwayland polkit-kde-agent sddm pulseaudio alsa-utils pavucontrol alacritty mupdf sxiv chromium git
sudo systemctl enable sddm.service

mkdir ~/.config/ 
mkdir ~/.config/sway
mkdir ~/.config/waybar

cd --
mkdir ~/Git
cd ~/Git && git clone https://github.com/lautarogalante/dotfiles.git

sudo cp ~/Git/dotfiles/config/sway/config ~/.config/sway/config
sudo cp ~/Git/dotfiles/config/waybar/config ~/.config/waybar/config
sudo cp ~/Git/dotfiles/config/waybar/style.css ~/.config/waybar/style.css
