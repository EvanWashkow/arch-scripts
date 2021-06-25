#!/bin/sh

# Remove old .zshrc
sudo rm /etc/skel/.zshrc

# Install OhMyZSH
yay -S oh-my-zsh-git

# Set up default ZSH config for new users
sudo nano /etc/default/useradd
sudo ln -s /usr/share/oh-my-zsh/zshrc /etc/skel/.zshrc

# Set up ZSH config for current user
rm ~/.zshrc
cp /etc/skel/.zshrc ~

# Output message to restart browser
echo "Please re-open your terminal"
