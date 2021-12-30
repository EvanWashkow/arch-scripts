# Arch Scripts
Installation scripts for Arch Linux

## General execution order

### As Root...

1. After first install...
    1. `arch-chroot` into the machine
    2. Run `sudo pacman -Sy`
    3. `sudo pacman -S git`
    4. Clone this repo to the `/root` directory
    5. Run Distribution-specific scripts (`Distribution`)
        * This will provide a baseline for the later scripts
    6. Install System (`System/InstallSystem.sh`)
    7. Install audio drivers. Choose one:
        * `Audio/InstallPulseAudio.sh`
        * `Audio/InstallPipewire.sh`
    8. Install graphics drivers. (`Graphics`)
        * `Graphics/InstallIntel.sh` - supports cards >= 2014
        * `Graphics/InstallNvidia.sh`
        * `Graphics/InstallNvidiaPrime.sh` - adds the official `prime-run` command
    9. Delete this repo from the `/root` directory
2. Reboot

### As User...

1. Install core system utilities
    1. Connect to wifi: `nmtui`
    2. Change keyboard layout
        * Change Keymap (`sudo localectl set-keymap dvorak`)
    3. Clone this repo to the current user's home directory
    4. Install AUR Common Packages (`System/InstallSystemAur.sh`)
    5. Install needed Pacman Hooks (`Pacman/Hook`)
2. Reboot
3. Install common packages and utilities
    1. Setup Command-line Shell (`CommandLineShell`)
    2. Install Desktop Environment (`DesktopEnvironment`)
    3. Rank package mirrors
        1. Set up Pacman Mirror Ranking (`Pacman/MirrorRanking/Setup*.sh`)
        2. Rank Mirrors (`Pacman/MirrorRanking/RankMirrors.sh`)
    4. Setup the User (`User/SetupUser.sh`)
4. Update system
    1. Run `yay -Syu`
    2. Run `sudo etc-update`, resolving conflicts
5. Modify Bootloader
    1. Replace udev with systemd
        1. `sudo nano /etc/mkinitcpio.conf`
        2. Replace "udev usr resume" with "systemd" in the HOOKS field. (Sources below):
            * https://wiki.archlinux.org/index.php/mkinitcpio#Common_hooks
            * https://bbs.archlinux.org/viewtopic.php?id=169988
        3. If you experience problems with Nvidia...
            1. [Try loading the kernel module earlier](https://wiki.archlinux.org/title/NVIDIA#Early_loading).
            2. [And add a Pacman hook](https://wiki.archlinux.org/title/NVIDIA#pacman_hook)
        4. Run `sudo mkinitcpio -P`
    2. Set up silent boot
        1. Add boot parameters
            * [Silent boot](https://wiki.archlinux.org/index.php/silent_boot#Kernel_parameters)
            * [Nvidia DRM](https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting)
        2. Change timeout to zero
        3. Rebuild bootloader
            1. Grub: https://wiki.archlinux.org/index.php/GRUB#Generated_grub.cfg
6. Reboot
7. Install Applications
    1. (`Application`)
    2. Any others
8. Remove orphaned packages (`Pacman/RemoveOrphanedPackages.sh`)
9. Remove uninstalled package cache (Run `sudo pacman -Sc`)
10. Reboot
