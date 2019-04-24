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
sudo pacman -S system-config-printer

yay tusk
yay google-chrome

yay icaclient
mkdir -p $HOME/.ICAClient/cache
cp /opt/Citrix/ICAClient/config/{All_Regions,Trusted_Region,Unknown_Region,canonicalization,regions}.ini $HOME/.ICAClient/

yay skypeforlinux-stable-bin

yay gnomit
git config --global core.editor "flatpak run ind.ie.Gnomit"

yay lifeograph
yay google-drive-ocamlfuse
yay google-chrome
sudo ln -s /bin/google-chrome-stable /bin/chrome
