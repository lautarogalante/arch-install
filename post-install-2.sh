# Estos son paquetes para mi configuración de escritorio.
sudo pacman -S sway xorg-xwayland polkit-kde-agent sddm pulseaudio alsa-utils pavucontrol alacritty mupdf sxiv chromium git
sudo systemctl enable sddm.service

mkdir ~/.config/ 
mkdir ~/.config/sway
mkdir ~/.config/waybar
mkdir ~/.config/alacritty

cd --
mkdir ~/Git
cd ~/Git && git clone https://github.com/lautarogalante/dotfiles.git

cp ~/Git/dotfiles/config/sway/config ~/.config/sway/config
cp ~/Git/dotfiles/config/waybar/config ~/.config/waybar/config
cp ~/Git/dotfiles/config/waybar/style.css ~/.config/waybar/style.css
cp ~/Git/dotfiles/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
