#!/bin/sh

# libinput-gestures: https://wiki.archlinux.org/index.php/Libinput#libinput-gestures

# gestures (depends on libinput-gestures): https://aur.archlinux.org/packages/gestures/
yay -S gestures
yay -S --needed --asdeps xdotool

# https://github.com/bulletmark/libinput-gestures#installation
sudo gpasswd -a $USER input

# https://github.com/bulletmark/libinput-gestures#configuration
libinput-gestures-setup autostart
