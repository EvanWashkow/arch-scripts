# Arch Scripts

These installation scripts setup a new Arch Linux install.

## Execute, in order

### After first install

1. `arch-chroot` into the machine.
2. `sudo pacman -Sy`
3. `sudo pacman -S git`
4. Clone this repo to `/root`.
5. Run Distribution-specific scripts (`Distribution`).
    * This will provide a baseline for the later scripts.
6. `System/InstallSystem.sh`
7. Install audio drivers. Choose one:
    * `Audio/InstallPulseAudio.sh`
    * `Audio/InstallPipewire.sh`
8. Install graphics drivers.
    * `Graphics/InstallIntel.sh` - supports cards >= 2014.
    * `Graphics/InstallNvidia.sh`
    * `Graphics/InstallNvidiaPrime.sh` - adds the official `prime-run` command.
9. Delete this repo from the `/root` directory.
10. Reboot.

### Setup system as User

1. Connect to wifi: `nmtui`.
2. Change keyboard layout.
    * `sudo localectl set-keymap dvorak`
3. Clone this repo to `~/Repos`.
4. `System/InstallSystemAur.sh`
5. Install needed Pacman Hooks (`Pacman/Hook`).
6. Rank package mirrors.
    1. Set up Pacman Mirror Ranking (`Pacman/MirrorRanking/Setup*.sh`).
    2. `Pacman/MirrorRanking/RankMirrors.sh`
7. `User/SetupUser.sh`
8. Reboot.

### Modify Boot

1. Modify Bootloader.
    1. Add boot parameters.
        * [Silent boot](https://wiki.archlinux.org/index.php/silent_boot#Kernel_parameters)
        * [Nvidia DRM](https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting)
    2. Change timeout to zero.
    3. Rebuild bootloader.
        1. Grub: https://wiki.archlinux.org/index.php/GRUB#Generated_grub.cfg
2. `sudo nano /etc/mkinitcpio.conf`
    1. Replace "udev usr resume" with "systemd" in the HOOKS field. (Sources below):
        * https://wiki.archlinux.org/index.php/mkinitcpio#Common_hooks
        * https://bbs.archlinux.org/viewtopic.php?id=169988
    2. If you experience problems with Nvidia...
        1. [Try loading the kernel module earlier](https://wiki.archlinux.org/title/NVIDIA#Early_loading).
        2. [And add a Pacman hook to reapply this change on nvidia upgrade](https://wiki.archlinux.org/title/NVIDIA#pacman_hook).
    3. Save.
    4. `sudo mkinitcpio -P`
6. Reboot.

### Install Desktop Environment

1. Setup Command-line Shell (`CommandLineShell`).
2. Install Desktop Environment (`DesktopEnvironment`).
    * If using Wayland + Nvidia, [ensure xorg-xwayland is installed](https://wiki.archlinux.org/title/Wayland#XWayland).
3. Update system.
    1. `yay -Syu`
    2. `sudo etc-update`
    3. Resolve conflicts.
4. Reboot.

### Configure System and Install Applications

1. Configure.
    * `nvidia-xconfig` (for Nvidia graphics cards)
2. Install Applications.
    * (`Application`)
    * Any others.
3. Remove orphaned packages (`Pacman/RemoveOrphanedPackages.sh`).
4. Remove uninstalled package cache (Run `sudo pacman -Sc`).
5. Reboot.
