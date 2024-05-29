# autoinstall_linux
Shell script for Arch-based Linux distributions that installs dependencies and applications to run most games, performs a full system update and creates a system restoration point using Timeshift.

**If all programs are installed, it will only update all system packages and create the restoration point.**

You can open an issue to report problems or suggest additions and improvements to the script. 

## Basic bundle:

- Can clone and install **Nvidia's latest proprietary drivers** using the FroggingFamily `nvidia-all` installer if there's a Nvidia graphics card detected - user choice.
- Installs all **PulseAudio and ALSA drivers**, and multilib compatibility for them to fix some issues with game audio on Lutris.
- Installs **Discover** for GUI-oriented package management for distributions that don't have it by default like Endeavour.
- Installs **Vivaldi**, degoogled chromium-based web browser with built-in ad-blocking and strict privacy controls.
- Installs **Timeshift**, system restoration point manager.
- Installs **Discord** voice chatting and community app.
- Installs `flatpak` and `yay` for package management.
- Installs the **Libreoffice** app suite for documents and **Krita** for your digital art needs.
- Installs an unofficial **Microsoft Teams** app from Flathub that works well for your professional needs.
- Performs a full system update to all `pacman`, **AUR** and `flatpak` packages. 
- **Creates a system restore point with Timeshift**.

## Gamer bundle:

- Can clone and install **Nvidia's latest proprietary drivers** using the FroggingFamily `nvidia-all` installer if there's a Nvidia graphics card detected - user choice.
- Installs all **PulseAudio and ALSA drivers**, and multilib compatibility for them to fix some issues with game audio on Lutris.
- Installs **Discover** for GUI-oriented package management for distributions that don't have it by default like Endeavour.
- Installs **Vivaldi**, degoogled chromium-based web browser with built-in ad-blocking and strict privacy controls.
- Installs **Timeshift**, system restoration point manager.
- Installs **Discord** voice chatting and community app.
- Installs `flatpak` and `yay` for package management.
- Installs `wine`, `wine-gecko`, `wine-mono`, `vkd3d` and `lib32-vkd3d` in their latest versions to system to fix some issues with games on Lutris.
- Installs `v4l-utils`, `v4l2loopback-dkms` and `v4l2loopback-utils` to fix some issues with webcams and enable Virtual Camera in OBS Studio.
- Installs **Steam**, **Lutris**, **Heroic Games Launcher**, **Greenlight** (Flathub) and **Hydra Launcher** (AUR) to download and manage your games.
- Installs the **Libreoffice** app suite for documents.
- Performs a full system update to all `pacman`, **AUR** and `flatpak` packages. 
- **Creates a system restore point with Timeshift**.
