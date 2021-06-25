#!/bin/sh

# Install YAY
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sicr
cd ..
rm -rdf yay

# Install AUR utilities
yay -S etc-update
