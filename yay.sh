sudo pacman -S --needed base-devel
mkdir ~/packages
cd ~/packages
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay hunspell-da
yay git-cola

yay epson-inkjet-printer-201207w
yay iscan-plugin-network

yay tusk
yay google-chrome

