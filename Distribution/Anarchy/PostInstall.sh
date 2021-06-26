#!/bin/sh

sudo pacman -Rns \
    adobe-source-code-pro-fonts \
    alsa-card-profiles \
    alsa-lib \
    alsa-topology-conf \
    alsa-ucm-conf \
    vim \
    zsh-syntax-highlighting
sudo pacman -Rns $(pacman -Qe | grep "^lib")
