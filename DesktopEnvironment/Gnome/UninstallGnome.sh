#!/bin/sh

# Get package variables
source $(dirname $0)/PackageVariables.sh

# Install packages
yay -Rns $requiredPackages $optionalPackages

# Disable services
sudo systemctl disable gdm
