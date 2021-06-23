#!/bin/sh

source $(dirname $0)/PackageVariablesAur.sh
yay -S $requiredPackages
