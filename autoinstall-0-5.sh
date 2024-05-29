#!/bin/sh
echo "Language:"
select lang in "en-US" "pt-BR"; do
  case $lang in
    en-US )
      echo "This is the *Psygreg AutoInstall Script*. It will perform a complete system update, and install required dependencies, drivers and applications to run games on Linux.";
      echo "If all programs are already installed, it will just perform the system update and create a system restore point through Timeshift.";
      echo "Proceed?";
      select yn in "Yes" "No"; do
        case $yn in
          Yes )
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
                  No ) break;;
                esac
              done
            else
              echo "Nvidia GPU not detected, skipping..."
            fi;
            sudo pacman -S --needed --noconfirm discover timeshift vivaldi libreoffice-fresh lib32-vkd3d vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono pulseaudio-alsa freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire lib32-openal flatpak yay v4l2loopback-dkms v4l2loopback-utils v4l-utils;
            flatpak install -y --noninteractive --or-update com.obsproject.Studio net.lutris.Lutris org.prismlauncher.PrismLauncher com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.unknownskl.greenlight;
            yay --noconfirm;
            yay -S --needed --noconfirm xone-dkms hydra-launcher;
            sudo timeshift --create --comments "AutoInstall Restore Point" --tags W;
            echo "Script Psygreg AutoInstall has finished successfully. Reboot to apply all changes.";
            exit 0;;
          No ) exit 0;;
        esac
      done;;
    pt-BR )
      echo "Este é o script *Psygreg AutoInstall*. Ele atualiza completamente o sistema, instala todos os aplicativos, drivers e dependências necessárias para jogar no Linux, drivers para controles de Xbox One e Series, assim como um navegador baseado em chromium com melhor compatibilidade com alguns sites, Vivaldi, e um gerenciador de pontos de restauração do sistema, Timeshift, criando um ponto de restauração ao final do processo.";
      echo "Se todos os programas já tiverem sido instalados, ele só irá fazer uma atualização completa do sistema e criará um ponto de restauração quando finalizar.";
      echo "Deseja continuar?";
      select sn in "Sim" "Não"; do
        case $sn in
          Sim )
            gpu=$(lspci | grep -i '.* vga .* nvidia .*')
            shopt -s nocasematch
            if [[ $gpu == *' nvidia '* ]]; then
              printf 'Você possui gráficos Nvidia:  %s\n' "$gpu"
              echo "Você gostaria de instalar ou atualizar os drivers proprietários Nvidia?"
              select drvbr in "Sim" "Não"; do
                case $drvbr in
                  Sim )
                     git clone https://github.com/Frogging-Family/nvidia-all.git && cd nvidia-all && makepkg -si;
                     break;;
                  Não ) break;;
                esac
              done
            else
              echo "GPU Nvidia não detectada, pulando..."
            fi;
            sudo pacman -S --needed --noconfirm discover timeshift vivaldi libreoffice-fresh lib32-vkd3d vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono pulseaudio-alsa freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire lib32-openal flatpak yay v4l2loopback-dkms v4l2loopback-utils v4l-utils;
            flatpak install -y --noninteractive --or-update com.obsproject.Studio net.lutris.Lutris org.prismlauncher.PrismLauncher com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.unknownskl.greenlight;
            yay --noconfirm;
            yay -S --needed --noconfirm xone-dkms hydra-launcher;
            sudo timeshift --create --comments "AutoInstall Restore Point" --tags W;
            echo "Script Psygreg AutoInstall concluído com sucesso. Reinicie o computador para que as alterações tenham efeito!";
            exit 0;;
          Não ) exit 0;;
        esac
      done;;
    esac
  done
#this is the automated install script for gamers on Linux by psygreg. any issues must be reported on the discord community found at linktr.ee/psygreg
