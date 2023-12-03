
sudo pacman -S xorg-xwayland wlroots qt6-wayland sway waybar polkit-kde-agent sddm pipewire pipewire-pulse wireplumber pavucontrol alacritty mupdf sxiv chromium git

sudo systemctl enable sddm.service
systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
systemctl --user enable wireplumber.service

mkdir ~/.config/ 
mkdir ~/.config/sway
mkdir ~/.config/waybar


mkdir ~/Git
cd !$ 
git clone https://github.com/lautarogalante/dotfiles.git

sudo cp ~/Git/dotfiles/config/sway/config ~/.config/sway/config
sudo cp ~/Git/dotfiles/config/waybar/config ~/.config/waybar/config
sudo cp ~/Git/dotfiles/config/waybar/style.css ~/.config/waybar/style.css


