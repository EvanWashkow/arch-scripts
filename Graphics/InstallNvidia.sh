#!/bin/sh

# https://wiki.archlinux.org/title/NVIDIA
# https://wiki.archlinux.org/title/xorg#Driver_installation

sudo pacman -S --needed nvidia
sudo pacman -D --asdeps nvidia-settings opencl-nvidia xorg-server-devel
