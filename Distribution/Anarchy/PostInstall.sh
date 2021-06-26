#!/bin/sh

libs=$(pacman -Qe | grep "^lib")
sudo pacman -Rns --noconfirm \
    adobe-source-code-pro-fonts \
    alsa-card-profiles \
    alsa-lib \
    alsa-topology-conf \
    alsa-ucm-conf \
    $libs \
    vim \
    zsh-syntax-highlighting
