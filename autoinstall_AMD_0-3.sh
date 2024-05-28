#!/bin/sh
echo "Este é o script *Psygreg AutoInstall*. Ele atualiza completamente o sistema, instala todos os aplicativos e dependências necessárias para jogar no Linux, drivers para controles de Xbox One e Series, assim como um navegador baseado em chromium com melhor compatibilidade com alguns sites, Vivaldi, e um gerenciador de pontos de restauração do sistema, Timeshift, criando um ponto de restauração ao final do processo."
echo "Se todos os programas já tiverem sido instalados, ele só irá fazer uma atualização completa do sistema e criará um ponto de restauração quando finalizar."
echo "Deseja continuar?"
select sn in "Sim" "Não"; do
  case $sn in
    Sim ) ;;
    Não ) exit 0;;
  esac
sudo pacman -S --needed --noconfirm timeshift vivaldi libreoffice-fresh lib32-vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono pulseaudio-alsa freetype2 lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-pipewire lib32-openal flatpak yay
flatpak install -y --noninteractive --or-update com.obsproject.Studio net.lutris.Lutris org.prismlauncher.PrismLauncher com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.unknownskl.greenlight
yay --noconfirm
yay -S --needed --noconfirm xone-dkms hydra-launcher
sudo timeshift --create --comments "AutoInstall Restore Point" --tags O
echo "Script Psygreg AutoInstall concluído com sucesso. Reinicie o computador para que as alterações tenham efeito!"
done
exit 0
#this is the automated install script for gamers on Linux by psygreg. any issues must be reported on the discord community found at linktr.ee/psygreg
