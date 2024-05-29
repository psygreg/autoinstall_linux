#!/bin/sh
echo "Language:"
select lang in "en-US" "pt-BR"; do
  case $lang in
    en-US )
      echo "This is the *Psygreg AutoInstall Script*."
      echo "It will perform a complete system update, and install required dependencies, drivers and applications to your Arch-based Linux system.";
      echo "If all programs are already installed, it will just perform the system update and create a system restore point through Timeshift.";
      echo "Which bundle do you wish to install?"
      select bundle in "Basic" "Gaming" "Cancel"; do
        case $bundle in
          Basic )
            gpu=$(lspci | grep -i '.* vga .* nvidia .*')
            shopt -s nocasematch
            if [[ $gpu == *' nvidia '* ]]; then
              printf 'Nvidia GPU is present:  %s\n' "$gpu"
              echo "Would you like to install or update to the latest Nvidia proprietary drivers?"
              select drv in "Yes" "No"; do
                case $drv in
                  Yes )
                    git clone https://github.com/Frogging-Family/nvidia-all.git && cd nvidia-all && makepkg -si;
                    break;;
                  No )
                    echo "Skipping Nvidia drivers...";
                    break;;
                esac
              done
            else
              echo "Nvidia GPU not detected, skipping..."
            fi;
            sudo pacman -S --needed --noconfirm discover timeshift vivaldi libreoffice-fresh krita wine wine-gecko wine-mono pulseaudio-alsa freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire lib32-openal flatpak yay v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2;
            flatpak install -y --noninteractive --or-update com.github.IsmaelMartinez.teams_for_linux;
            yay --noconfirm;
            yay -S --needed --noconfirm appimagelauncher debtap;
            sudo timeshift --create --comments "AutoInstall Restore Point" --tags W;
            echo "Script Psygreg AutoInstall has finished successfully. Reboot to apply all changes.";
            exit 0;;
          Gaming )
            gpu=$(lspci | grep -i '.* vga .* nvidia .*')
            shopt -s nocasematch
            if [[ $gpu == *' nvidia '* ]]; then
              printf 'Nvidia GPU is present:  %s\n' "$gpu"
              echo "Would you like to install or update to the latest Nvidia proprietary drivers?"
              select drv in "Yes" "No"; do
                case $drv in
                  Yes )
                    git clone https://github.com/Frogging-Family/nvidia-all.git && cd nvidia-all && makepkg -si;
                    break;;
                  No )
                    echo "Skipping Nvidia drivers...";
                    break;;
                esac
              done
            else
              echo "Nvidia GPU not detected, skipping..."
            fi;
            sudo pacman -S --needed --noconfirm discover timeshift vivaldi libreoffice-fresh lib32-vkd3d vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono pulseaudio-alsa freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire lib32-openal flatpak yay v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2;
            flatpak install -y --noninteractive --or-update com.obsproject.Studio net.lutris.Lutris org.prismlauncher.PrismLauncher com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.unknownskl.greenlight;
            yay --noconfirm;
            yay -S --needed --noconfirm xone-dkms hydra-launcher appimagelauncher debtap;
            sudo timeshift --create --comments "AutoInstall Restore Point" --tags W;
            echo "Script Psygreg AutoInstall has finished successfully. Reboot to apply all changes.";
            exit 0;;
          Cancel )
            echo "Operation cancelled.";
            exit 0;;
        esac
      done;;
    pt-BR )
      echo "Este é o script *Psygreg AutoInstall*."
      echo "Ele atualiza completamente o sistema, instala todos os aplicativos, drivers e dependências necessárias para seu sistema Linux baseado em Arch.";
      echo "Se todos os programas já tiverem sido instalados, ele só irá fazer uma atualização completa do sistema e criará um ponto de restauração quando finalizar.";
      echo "Qual pacote deseja instalar?";
      select pacote in "Básico" "Gamer" "Cancelar"; do
        case $pacote in
          Básico )
            gpu=$(lspci | grep -i '.* vga .* nvidia .*')
            shopt -s nocasematch
            if [[ $gpu == *' nvidia '* ]]; then
              printf 'GPU Nvidia detectada:  %s\n' "$gpu"
              echo "Você gostaria de instalar ou atualizar os drivers proprietários Nvidia?"
              select drvbr in "Sim" "Não"; do
                case $drvbr in
                  Sim )
                    git clone https://github.com/Frogging-Family/nvidia-all.git && cd nvidia-all && makepkg -si;
                    break;;
                  Não )
                    echo "Pulando drivers Nvidia...";
                    break;;
                esac
              done
            else
              echo "GPU Nvidia não detectada, pulando..."
            fi;
            sudo pacman -S --needed --noconfirm discover timeshift vivaldi libreoffice-fresh krita wine wine-gecko wine-mono pulseaudio-alsa freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire lib32-openal flatpak yay v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2;
            flatpak install -y --noninteractive --or-update com.github.IsmaelMartinez.teams_for_linux;
            yay --noconfirm;
            yay -S --needed --noconfirm appimagelauncher debtap;
            sudo timeshift --create --comments "AutoInstall Restore Point" --tags W;
            echo "Operações concluídas. Reinicie para aplicar as alterações.";
            exit 0;;
          Gamer )
            gpu=$(lspci | grep -i '.* vga .* nvidia .*')
            shopt -s nocasematch
            if [[ $gpu == *' nvidia '* ]]; then
              printf 'GPU Nvidia detectada:  %s\n' "$gpu"
              echo "Você gostaria de instalar ou atualizar os drivers proprietários Nvidia?"
              select drvbr in "Sim" "Não"; do
                case $drvbr in
                  Sim )
                    git clone https://github.com/Frogging-Family/nvidia-all.git && cd nvidia-all && makepkg -si;
                    break;;
                  Não )
                    echo "Pulando drivers Nvidia...";
                    break;;
                esac
              done
            else
              echo "GPU Nvidia não detectada, pulando..."
            fi;
            sudo pacman -S --needed --noconfirm discover timeshift vivaldi libreoffice-fresh lib32-vkd3d vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono pulseaudio-alsa freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire lib32-openal flatpak yay v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2;
            flatpak install -y --noninteractive --or-update com.obsproject.Studio net.lutris.Lutris org.prismlauncher.PrismLauncher com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.unknownskl.greenlight;
            yay --noconfirm;
            yay -S --needed --noconfirm xone-dkms hydra-launcher appimagelauncher debtap;
            sudo timeshift --create --comments "AutoInstall Restore Point" --tags W;
            echo "Operações concluídas. Reinicie para aplicar as alterações.";
            exit 0;;
          Cancelar )
            echo "Operação cancelada.";
            exit 0;;
        esac
      done;;
  esac
done
#this is the automated install script for gamers on Linux by psygreg. any issues must be reported on the discord community found at linktr.ee/psygreg
