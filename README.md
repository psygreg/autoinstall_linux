# autoinstall_linux
Shell script for Arch-based Linux distributions that installs dependencies and applications to run most games, performs a full system update and creates a system restoration point using Timeshift.

**If all programs are installed, it will only update all system packages and create the restoration point.**

Use *autoinstall_NVIDIA* to install the latest proprietary NVIDIA drivers available from `nvidia-all`. Otherwise, use *autoinstall_AMD*.

You can open an issue to report problems or suggest additions and improvements to the script. 

## What this script does:

- Clone and install **Nvidia's latest proprietary drivers** using the FroggingFamily `nvidia-all` installer (*autoinstall_NVIDIA* only)
- Installs all **PulseAudio and ALSA drivers**, and multilib compatibility for them to fix some issues with game audio on Lutris.
- Installs **Vivaldi**, degoogled chromium-based web browser with built-in ad-blocking and strict privacy controls.
- Installs **Timeshift**, system restoration point manager.
- Installs `flatpak` and `yay` for package management.
- Installs `wine`, `wine-gecko`, `wine-mono`, `vkd3d` and `lib32-vkd3d` in their latest versions to system to fix some issues with games on Lutris.
- Installs **Steam**, **Lutris**, **Heroic Games Launcher**, **Greenlight** (Flathub) and **Hydra Launcher** (AUR) to download and manage your games.
- Installs the **Libreoffice** app suite for documents.
- Performs a full system update to all `pacman`, **AUR** and `flatpak` packages. 
- **Creates a system restore point with Timeshift**.
