#!/bin/bash
set -e

# REPO UPDATE
sudo apt update
sudo apt dist-upgrade

# USER SETUP
chown -R $username:$username /home/$username
#sudo chown -R $USER:$USER ~

# TURN ON
# /etc/apt/sources.list (sid; contrib; non-free;)

# NALA INSTALL
sudo apt install nala -y

# BASE XORG
sudo nala install xorg -y
sudo nala install build-essential -y
sudo nala install libx11-dev -y
sudo nala install libxinerama-dev -y
sudo nala install libxft-dev -y
sudo nala install libx11-xcb-dev -y
sudo nala install libxcb-res0-dev -y
sudo nala install libfreetype6-dev -y
sudo nala install libfontconfig1-dev -y
sudo nala install xdg-desktop-portal -y
sudo nala install x11-xserver-utils -y

# Microcode
sudo nala install amd64-microcode -y

# FONTS
sudo nala install fonts-cantarell -y
sudo nala install fonts-noto -y
sudo nala install ttf-bitstream-vera -y
sudo nala install fonts-dejavu -y
sudo nala install fonts-hack -y
sudo nala install fonts-inconsolata -y
sudo nala install fonts-liberation -y
sudo nala install fonts-roboto -y
sudo nala install fonts-noto-color-emoji -y
sudo nala install fonts-font-awesome -y

# 32-BIT
sudo dpkg --add-architecture i386

# BASE PROGRAMS
sudo nala install kitty -y
sudo nala install picom -y
sudo mkdir ~/.config/picom
sudo cp picom.conf ~/.config/picom
sudo nala install rofi -y
sudo nala install feh -y
sudo nala install lxappearance -y
sudo nala install inxi -y
sudo nala install gnome-disk-utility -y
sudo nala install pipewire -y
sudo nala install curl -y
sudo nala install lxpolkit -y
sudo nala install pavucontrol -y
sudo nala install dkms -y
sudo nala install linux-headers-generic -y
sudo nala install firefox-esr -y
sudo nala install neofetch -y
sudo nala install pcmanfm -y
sudo nala install xarchiver -y
sudo nala install ntfs-3g -y
sudo nala install os-prober -y
sudo nala install wget -y
sudo nala install usb-modeswitch -y
sudo nala install wine -y
sudo nala install winetricks -y
sudo nala install gparted -y
sudo nala install feh -y
sudo nala install conky -y
sudo mkdir /home/$USER/.config/conky
sudo cp conky.conf /home/$USER/.config/conky
sudo nala install lm-sensors -y
sudo nala install xdg-user-dirs -y
xdg-user-dirs-update
sudo nala install qbittorrent -y
sudo nala install lutris -y
sudo nala install galculator -y
sudo nala install ristretto -y
sudo nala install mangohud -y
sudo nala install gamemode -y
sudo nala install volumeicon-alsa -y
sudo nala install nm-tray -y
sudo nala install alacritty -y
sudo nala install vim -y
sudo nala install vlc -y


# THEME INSTALL
sudo nala install yaru-theme-* -y

# FLATPAK
sudo nala install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.freetubeapp.FreeTube -y
flatpak install flathub com.github.tchx84.Flatseal -y
sudo cp -a overrides /home/$USER/.local/share/flatpak
flatpak install flathub dev.vencord.Vesktop -y
flatpak install flathub org.jellyfin.JellyfinServer -y

# DEPENDECIES
#sudo nala install python3-pydbus gettext lm-sensors libgtksourceview-4-dev python3-psutil libgconf-2-4 libappindicator1 libc++1 gconf2 libsystemd-dev pkg-config ninja-build git libdbus-1-dev libinih-dev build-essential python3-dev libgirepository1.0-dev appstream-util python3 python3-pip libdazzle-1.0-dev debhelper debugedit dh-autoreconf dh-strip-nondeterminism dwz fp-compiler fp-compiler-3.2.2 fp-docs-3.2.2 fp-ide-3.2.2 fp-units-base-3.2.2 fp-units-db-3.2.2 fp-units-fcl-3.2.2 fp-units-fv-3.2.2 fp-units-gfx-3.2.2 fp-units-gtk2-3.2.2 fp-units-math-3.2.2 fp-units-misc-3.2.2 fp-units-multimedia-3.2.2 fp-units-net-3.2.2 fp-units-rtl-3.2.2 fp-utils-3.2.2 fpc fpc-3.2.2 fpc-source-3.2.2 gdb gir1.2-gtk-2.0 intltool-debian lcl-2.2 lcl-gtk2-2.2 lcl-nogui-2.2 lcl-units-2.2 lcl-utils-2.2 liba52-0.7.4 liba52-0.7.4-dev libarchive-cpio-perl libarchive-zip-perl libasound2-dev libbabeltrace1 libc6-dbg libcaca-dev libdebhelper-perl libdebuginfod-common libdebuginfod1 libfile-stripnondeterminism-perl libflac-dev libfluidsynth3 libforms-dev libforms2 libgd-dev libgl1-mesa-dev libglu1-mesa-dev libgmp-dev libgmpxx4ldbl libgraphviz-dev libgtk2.0-dev libgvc6-plugins-gtk libinstpatch-1.0-2 libipt2 libltdl-dev libmad0 libmad0-dev libmail-sendmail-perl libmikmod-dev libmodplug-dev libmodplug1 libogg-dev libproxy-tools libpulse-dev libsdl-mixer1.2 libsdl-mixer1.2-dev libsdl1.2-dev libslang2-dev libsource-highlight-common libsource-highlight4v5 libsub-override-perl libsys-hostname-long-perl libtool libvlc-bin libvlc-dev libvlc5 libvlccore9 libvorbis-dev libvpx-dev libxdot4 libxpm-dev libxt-dev libxxf86dga-dev libxxf86vm-dev m4 po-debconf gcc-multilib g++-multilib mesa-common-dev libxnvctrl-dev python3-evdev python3-decorator python3-pyte libpython3-dev python3-setuptools python3-pydantic meson v4l2loopback-dkms v4l-utils v4l2loopback-utils libqt5sql5 libqt5svg5 libqt5xml5 libspeexdsp1 ffmpeg -y

# STEAM
sudo nala install steam-installer -y
sudo chmod +x update-proton-ge
./update-proton-ge

# NOUVEAU DRIVER DISABLE
sudo cp blacklist-nouveau.conf /etc/modprobe.d/
sudo cp nouveau-kms.conf /etc/modprobe.d/
sudo update-initramfs -u

# BLUETOOTH
sudo nala install bluez -y
sudo nala install bluez-tools -y
sudo nala install blueman -y
sudo nala install bluetooth -y

# AUTORUN
cp .xinitrc /home/$USER/
cp .bash_profile /home/$USER/

# WALLPAPER
cp wallpaper.jpg /home/$USER/Pictures/

# STEAM DOWNLOAD FIX
#sudo cp steam_dev.cfg /.local/share/Steam/