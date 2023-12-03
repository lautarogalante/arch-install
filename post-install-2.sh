
sudo pacman -S xorg-xwayland wlroots qt6-wayland sway waybar polkit-kde-agent sddm pipewire pipewire-jack pavucontrol alacritty mupdf sxiv chromium
sudo systemctl enable sddm.service

mkdir ~/.config/ 
mkdir ~/.config/sway
mkdir ~/.config/waybar

sudo cp /usr/share/pipewire ~/.config/pipewire

mkdir ~/Git
cd !$ 
git clone https://github.com/lautarogalante/dotfiles.git

sudo cp ~/Git/dotfiles/config/sway/config ~/.config/sway/config
sudo cp ~/Git/dotfiles/config/waybar/config ~/.config/waybar/config
sudo cp ~/Git/dotfiles/config/waybar/style.css ~/.config/waybar/style.css


