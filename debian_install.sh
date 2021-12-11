#!/bin/bash

echo "Beginning installation of TorchOS v1.0"
echo "Enter in your username to begin.."
read username_var


echo "Beginning installation of dependancies.."
apt -y install build-essential libx11-dev libxinerama-dev libxft-dev wget xinit xserver-xorg x11-server-utils \
		zsh perl curl gcc cmake make \
		chromium nitrogen

echo "retrieving dwm from suckless.org"
wget -q "https://dl.suckless.org/dwm/dwm-6.2.tar.gz"
echo "retrieving st from suckless.org"
wget -q "https://dl.suckless.org/st/st-0.8.tar.gz"
echo "retrieving dmenu from suckless.org"
wget -q "https://dl.suckless.org/tools/dmenu-5.0.tar.gz"

echo "extracting archives"
tar -xf dwm-6.2.tar.gz
tar -xf st-0.8.tar.gz
tar -xf dmenu-5.0.tar.gz

echo "removing archives"
rm *.tar.gz

echo "installing binaries"
cd dwm-6.2/
make clean install
cd ../st-0.8/
make clean install
cd ../dmenu-5.0/
make clean install

echo "setting up .xinitrc"

# code for setting up .xinitrc at the user's home directory

echo "customizing TorchOS install.."

# code for customization

