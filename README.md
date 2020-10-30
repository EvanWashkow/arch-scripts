# Arch Scripts
Installation scripts for Arch Linux

## General execution order
1. After initial install, `arch-chroot` into the machine
    1. Run Distribution-specific scripts (`Distribution`)
        * This will provide a baseline for the later scripts
    2. Install Base (`Base/InstallBase.sh`)
    3. Install Desktop of choice
2. Reboot
3. Setup Tier 1 components
    1. Change Keymap (`Keymap`)
    2. Connect to internet
    3. Install Pamac (`Pamac/InstallPamac.sh`)
    4. Enable AUR in Pamac > Preferences > AUR
    5. Install needed Pacman Hooks (`Pacman/Hook`)
4. Reboot
5. Setup Tier 2 components
    1. Set up Pacman Mirror Ranking (`Pacman/MirrorRanking`)
    2. Rank Mirrors (`Pacman/MirrorRanking`)
        * Important: these should be done after installing Pacman Hooks, because they may introduce updates.
6. Set up silent boot
    1. Modify bootloader
        1. Add these boot parameters: https://wiki.archlinux.org/index.php/silent_boot#Kernel_parameters
        2. Change timeout to zero
        3. Rebuild bootloader
        4. Bootloader info:
            1. Grub: https://wiki.archlinux.org/index.php/GRUB#Generated_grub.cfg
    2. Modify `/etc/mkinitcpio.conf`
        1. Replace "udev usr resume" with "systemd" in the HOOKS field ([source](https://wiki.archlinux.org/index.php/mkinitcpio#Common_hooks))
        2. Run `Mkinitcpio/UpdateMkinitcpio.sh`
7. Reboot
