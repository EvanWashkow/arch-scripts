#!/bin/sh

sudo pacman -s --needed pulseaudio

sudo pacman -S \
    pulseaudio-alsa \
    pulseaudio-bluetooth \
    pulseaudio-jack