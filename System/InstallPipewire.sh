#!/bin/sh

sudo pacman -S --needed pipewire

sudo pacman -S --asdeps \
    pipewire-alsa \
    pipewire-jack \
    pipewire-pulse