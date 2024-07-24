#!/bin/bash
#create temp folder and set cleanup
tmp="$(mktemp -d -t autoinstallXXXXX)"
cd "$tmp" || exit 2
#cleanup
cleanup() {
	rm -rf "$tmp" 
	}
trap cleanup EXIT
##VARS
#bundle variables
BASEPACMAN="sudo pacman -S --needed --noconfirm chromium libreoffice-fresh pinta wine wine-gecko wine-mono freetype2 flatpak v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2"
BASEFLAT="flatpak install -y --noninteractive --or-update com.github.IsmaelMartinez.teams_for_linux"
BASEAURA="aura -A --needed --noconfirm appimagelauncher debtap"
GAMEPACMAN="sudo pacman -S --needed --noconfirm timeshift lib32-vkd3d vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono freetype2 flatpak v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2 mangohud gamescope goverlay"
GAMEFLAT="flatpak install -y --noninteractive --or-update com.obsproject.Studio net.lutris.Lutris org.prismlauncher.PrismLauncher com.valvesoftware.Steam com.heroicgameslauncher.hgl io.github.unknownskl.greenlight com.discordapp.Discord com.valvesoftware.Steam.VulkanLayer.MangoHud org.freedesktop.Platform.VulkanLayer.MangoHud com.valvesoftware.Steam.Utility.MangoHud"
GAMEAURA="aura -A --needed --noconfirm xpad-neo-dkms appimagelauncher debtap"
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
languages() {
    if [ "$ulang" == "pt" ]; then
        intro () { 
            echo "Este é o script *Psygreg AutoInstall*."
            echo "Ele atualiza completamente o sistema, instala todos os aplicativos, drivers e dependências necessárias para seu sistema Linux baseado em Arch."
            echo "Se todos os programas já tiverem sido instalados, ele só irá fazer uma atualização completa do sistema e criará um ponto de restauração quando finalizar."             
            }
        bundleopt="Qual pacote deseja instalar?"
        cancel="Operação cancelada."
        success="Script Psygreg AutoInstall concluiu com sucesso. Reinicie para aplicar as alterações."
        radeoncheck="Patch Radeon-Vulkan já aplicado ou não é necessário, pulando..."
        noroot="Não execute o AutoInstall como root."
        arch="Pacman encontrado, iniciando..."
        noarch="Pacman não encontrado. Você está usando uma distribuição baseada em Arch?"
        auracheck="Aura já instalado, prosseguindo..."
    else
        intro () { 
            echo "This is the *Psygreg AutoInstall Script*."
            echo "It will perform a complete system update, and install required dependencies, drivers and applications to your Arch-based Linux system."
            echo "If all programs are already installed, it will just perform the system update and create a system restore point through Timeshift."            
            }
        bundleopt="Which bundle do you wish to install?"
        cancel="Operation cancelled."
        success="Script Psygreg AutoInstall has finished successfully. Reboot to apply all changes."
        radeoncheck="Radeon Vulkan fix already applied or unnecessary, skipping..."
        noroot="Do not run AutoInstall as root."
        arch="Pacman found. Starting..."
        noarch="Pacman not found. Are you using an Arch-based distro?"
        auracheck="Aura already installed, proceeding..."
    fi
}
#bundle picker
choose_bundle() {
	echo "1) Basic"
	echo "2) Gamer"
	echo "3) Cancel"
	read -p "(1, 2 or 3): " bundle
}
#restore point failsafe
restore() {
    sudo pacman -S --needed --noconfirm timeshift
    sudo timeshift --create --comments "Autoinstall Backup" --tags M
}
#aura install
aura_func () {
    if ! command -v aura &> /dev/null; then
        echo "$auracheck"
    else
        git clone https://aur.archlinux.org/aura-bin.git
        cd aura-bin || return
        makepkg -sir
    fi
}
#gpu detect function
gpu_detect() {
	GPU=$(lspci | grep -i '.* vga .* nvidia .*')
	shopt -s nocasematch
}
##nvidia driver functions
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
##DISABLED NVIDIA INSTALLER BC BUGS DONT MESS AROUND WITH THIS FOR NOW
#nvgpu() {
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
#}
##radeon vulkan patch
radeon_vlk() {
    if pacman -Qs amdvlk > /dev/null; then
        sudo pacman -R --noconfirm amdvlk lib32-amdvlk
        sudo pacman -S --needed --noconfirm vulkan-radeon lib32-vulkan-radeon
    else
        echo "$radeoncheck"
    fi
}
##SCRIPT RUN START
#get language
get_lang
languages
#root checker
if (( ! UID )); then
	echo "$noroot"
	exit 1
else
#check if OS is arch-based by looking for pacman
    if command -v pacman &> /dev/null; then
        echo "$arch"
    else
        echo "$noarch"
        exit 2
    fi
    intro
    ##RADEON FIX
    radeon_vlk
    ##BUNDLE INSTALL
        echo "$bundleopt"
        choose_bundle
        if [ "$bundle" == "1" ]; then
            restore            
            eval "$BASEPACMAN"
            eval "$BASEFLAT"
            aura_func
            eval "$BASEAURA"
        elif [ "$bundle" == "2" ]; then
            restore
	        eval "$GAMEPACMAN"
            eval "$GAMEFLAT"
            aura_func
            eval "$GAMEAURA"
        else
            echo "$cancel"
            exit 0
        fi
        echo "$success"
        exit 0
fi
