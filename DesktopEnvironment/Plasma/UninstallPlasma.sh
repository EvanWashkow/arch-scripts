#!/bin/sh

source $(dirname $0)/PackageVariables.sh

yay -Rns $requiredPackages $optionalPackages

sudo systemctl disable sddm
