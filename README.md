# autoinstall_linux
Shell script for Arch-based Linux distributions that installs dependencies and applications to run most games, performs a full system update and creates a system restoration point using Timeshift.

**If all programs are installed, it will only update all system packages and create the restoration point.**

You can open an issue to report problems or suggest additions and improvements to the script. 

## Basic bundle:

- Can clone and install **Nvidia's latest proprietary drivers** using the FroggingFamily `nvidia-all` installer if there's a Nvidia graphics card detected - user choice.
- If installing Nvidia drivers, will also check if **Prime** hybrid GPU functionality (for using integrated graphics) is necessary and configure it if so.
- **Pacman** installs: `chromium timeshift libreoffice-fresh krita wine wine-gecko wine-mono freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse pipewire-pulse lib32-pipewire lib32-openal flatpak yay v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2`
- **yay** installs: `pamac-all appimagelauncher debtap`
- **flatpak** installs: `com.github.IsmaelMartinez.teams_for_linux`


## Gamer bundle:

- Can clone and install **Nvidia's latest proprietary drivers** using the FroggingFamily `nvidia-all` installer if there's a Nvidia graphics card detected - user choice.
- If installing Nvidia drivers, will also check if **Prime** hybrid GPU functionality (for using integrated graphics) is necessary and configure it if so.
- **Pacman** installs: `timeshift libreoffice-fresh lib32-vkd3d vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono pipewire-pulse pulseaudio-alsa freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire lib32-openal flatpak yay v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2 mangohud gamescope goverlay`
- **yay** installs: `pamac-all xone-dkms hydra-launcher-bin appimagelauncher debtap`
- **flatpak** installs: `com.obsproject.Studio net.lutris.Lutris org.prismlauncher.PrismLauncher com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.unknownskl.greenlight com.discordapp.Discord com.valvesoftware.Steam.VulkanLayer.MangoHud org.freedesktop.Platform.VulkanLayer.MangoHud com.valvesoftware.Steam.Utility.MangoHud` 

