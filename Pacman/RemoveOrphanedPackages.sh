#!/bin/sh

# https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans)
pacman -Qtdq | sudo pacman -Rns -
