#!/bin/sh

sudo pacman -Rns --noconfirm \
    adobe-source-code-pro-fonts \
    alsa-card-profiles \
    alsa-lib \
    alsa-topology-conf \
    alsa-ucm-conf \
    $(pacman -Qe | grep "^lib") \
    vim \
    zsh-syntax-highlighting
