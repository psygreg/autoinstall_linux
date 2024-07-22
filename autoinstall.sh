#!/bin/bash
##VARS
#vars_bundles
BASEPACMAN="sudo pacman -S --needed --noconfirm chromium timeshift libreoffice-fresh pinta wine wine-gecko wine-mono freetype2 flatpak v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2"
BASEFLAT="flatpak install -y --noninteractive --or-update com.github.IsmaelMartinez.teams_for_linux"
BASEAURA="aura --noconfirm && aura -A --needed --noconfirm appimagelauncher debtap"
GAMEPACMAN="sudo pacman -S --needed --noconfirm timeshift lib32-vkd3d vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono freetype2 flatpak v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2 mangohud gamescope goverlay"
GAMEFLAT="flatpak install -y --noninteractive --or-update net.lutris.Lutris org.prismlauncher.PrismLauncher com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.unknownskl.greenlight com.discordapp.Discord com.valvesoftware.Steam.VulkanLayer.MangoHud org.freedesktop.Platform.VulkanLayer.MangoHud com.valvesoftware.Steam.Utility.MangoHud"
GAMEAURA="aura --noconfirm && aura -A --needed --noconfirm xpad-neo-dkms appimagelauncher debtap obs-studio-tytan652"
#vars_gpu
#NVIDIA="cd && git clone https://github.com/Frogging-Family/nvidia-all.git && cd nvidia-all && makepkg -si && cd && rm -r ~/nvidia-all"
#PRIME="sudo pacman -S --needed --noconfirm nvidia-prime"
#GPUS=$(lspci | grep VGA | wc -l)
##FUNCTIONS
#get language from OS
get_lang() {
      local lang="${LANG:0:2}"
      local available=("pt" "en")

      if [[ " ${available[*]} " == *"$lang"* ]]; then
          ulang="$lang"
      else
          ulang="en"
      fi
    }
#bundle picker
choose_bundle() {
	echo "1) Basic"
	echo "2) Gamer"
	echo "3) Cancel"
	read -p "(1, 2 or 3): " bundle
}
#basic bundle
basic_bundle() {            
    eval "$BASEPACMAN"
    eval "$BASEFLAT"
    aura_func
    eval "$BASEAURA"
}
#gamer bundle
gamer_bundle() {
	eval "$GAMEPACMAN"
    eval "$GAMEFLAT"
    aura_func
    eval "$GAMEAURA"
}
#yay function
aura_func () {
    if pacman -Qs aura > /dev/null; then
        echo "Aura already installed, proceeding..."
    else
        git clone https://aur.archlinux.org/aura-bin.git
        cd aura-bin || return
        makepkg -Si
    fi
}
#gpu detect function
gpu_detect() {
	GPU=$(lspci | grep -i '.* vga .* nvidia .*')
	shopt -s nocasematch
}
#nvidia driver functions
choose_nvidia() {
    echo "1) Yes"
    echo "2) No"
    read -p "(1 or 2): " drv
}
choose_nvidiabr() {
	echo "1) Sim"
	echo "2) Não"
	read -p "(1 ou 2): " drv
}
#radeon vulkan patch
radeon_vlk() {
    if pacman -Qs amdvlk > /dev/null; then
        sudo pacman -R --noconfirm amdvlk lib32-amdvlk
        sudo pacman -S --needed --noconfirm vulkan-radeon lib32-vulkan-radeon
    else
        echo "Radeon Vulkan fix already applied, skipping..."
    fi
}
##SCRIPT RUN START
#root checker
if (( ! UID )); then
	echo "Do not run AutoInstall as root."
	exit 1
else
#check if OS is arch-based by looking for pacman
    if command -v pacman &> /dev/null; then
        echo "Pacman found. Starting..."
    else
        echo "Pacman not found."
        exit 2
    fi
#get language
    get_lang
#en-US
    if [ "$ulang" == "en" ]; then
        echo "This is the *Psygreg AutoInstall Script*."
        echo "It will perform a complete system update, and install required dependencies, drivers and applications to your Arch-based Linux system."
        echo "If all programs are already installed, it will just perform the system update and create a system restore point through Timeshift." 
        #DISABLED NVIDIA GPU BC BUGS DONT MESS AROUND WITH THIS FOR NOW
        #detect nvidia GPU
        #gpu_detect
        #if [[ $GPU == *' nvidia '* ]]; then
            #printf 'Nvidia GPU is present:  %s\n' "$GPU"
            #echo "Would you like to install or update to the latest Nvidia proprietary drivers?"
            #choose_nvidia
            #if [ "$drv" == "1" ]; then
                #eval "$NVIDIA"
                #if [ "$GPUS" -gt 1 ]; then
                    #eval "$PRIME"
                #else
                    #echo "Single GPU system, PRIME not required. Skipping..."
                #fi
            #else
                #echo "Skipping Nvidia drivers..."
            #fi
        #else
            #echo "Nvidia GPU not detected."
        #fi
        ##RADEON FIX
        radeon_vlk
        ##BUNDLE INSTALL
        echo "Which bundle do you wish to install?"
        choose_bundle
        if [ "$bundle" == "1" ]; then
            basic_bundle
        elif [ "$bundle" == "2" ]; then
            gamer_bundle
        else
            "Operation cancelled."
            exit 0
        fi
        echo "Script Psygreg AutoInstall has finished successfully. Reboot to apply all changes."
        exit 0
#pt-BR
    elif [ "$ulang" == "pt" ]; then
        echo "Este é o script *Psygreg AutoInstall*."
        echo "Ele atualiza completamente o sistema, instala todos os aplicativos, drivers e dependências necessárias para seu sistema Linux baseado em Arch."
        echo "Se todos os programas já tiverem sido instalados, ele só irá fazer uma atualização completa do sistema e criará um ponto de restauração quando finalizar." 
        #DISABLED NVIDIA GPU BC BUGS DONT MESS AROUND WITH THIS FOR NOW
        #detect nvidia GPU
        #gpu_detect
        #if [[ $GPU == *' nvidia '* ]]; then
            #printf 'GPU Nvidia detectada:  %s\n' "$GPU"
            #echo "Você gostaria de instalar ou atualizar os drivers proprietários Nvidia?"
            #choose_nvidiabr
            #if [ "$drv" == "1" ]; then
                #eval "$NVIDIA"
                #if [ "$GPUS" -gt 1 ]; then
                    #eval "$PRIME"
                #else
                    #echo "Sistema sem modo GPU híbrida, pulando..."
                #fi
            #else
                #echo "Pulando drivers Nvidia..."
            #fi
        #else
            #echo "GPU Nvidia não detectada."
        #fi
        ##RADEON FIX
        radeon_vlk
        ##BUNDLE INSTALL
        echo "Qual pacote deseja instalar?"
        choose_bundle
        if [ "$bundle" == "1" ]; then
            basic_bundle
        elif [ "$bundle" == "2" ]; then
            gamer_bundle
        else
            echo "Operação cancelada."
            exit 0
        fi
        echo "Script Psygreg AutoInstall concluiu com sucesso. Reinicie para aplicar as alterações."
        exit 0
    fi
fi
