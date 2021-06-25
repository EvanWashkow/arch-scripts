#!/bin/sh

# Install common desktop environment packages
source $(dirname $0)/../Common/InstallCommon.sh

# Get package variables
source $(dirname $0)/PackageVariables.sh

# Install packages
yay -S $requiredPackages
yay -S --asdeps $optionalPackages

# Enable services
sudo systemctl enable gdm
