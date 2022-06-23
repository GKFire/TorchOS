#!/bin/bash

echo "Beginning installation of TorchOS v1.0"
echo "Enter in your username to begin.."
read USERNAMEVAR

# check if the username is valid.
if id "$USERNAMEVAR" &>/dev/null; then
    echo 'valid username'
else
    echo "That user doesn't exist"
	exit -1
fi

# The long download of packages.. 
echo "Beginning installation of dependancies.."
apt update
apt -y install build-essential libx11-dev libxinerama-dev libxft-dev xinit xserver-xorg x11-xserver-utils compton \
	fish perl curl gcc cmake make wget vim htop neofetch apt-transport-https \
	nitrogen fonts-font-awesome

# install suckless.org software
echo "installing binaries"
cd /opt/TorchOS/dwm-6.2/
make clean install
cd ../slstatus-dev/
make clean install
cd ../st-0.8.4/
make clean install
cd ../dmenu-5.0/
make clean install
cd ../

# copy .xinitrc file and correct permission
echo "setting up .xinitrc"
cp .xinitrc /home/$USERNAMEVAR/.xinitrc
chown $USERNAMEVAR.$USERNAMEVAR /home/$USERNAMEVAR/.xinitrc

# set user shell to fish
echo "customizing TorchOS install"
chsh -s /bin/fish $USERNAMEVAR

# correcting permissions
# must be an easier way..
cp -ur .config/ /home/$USERNAMEVAR/
chown $USERNAMEVAR.$USERNAMEVAR /home/$USERNAMEVAR/.config
chown $USERNAMEVAR.$USERNAMEVAR /home/$USERNAMEVAR/.config/fish	
chown $USERNAMEVAR.$USERNAMEVAR /home/$USERNAMEVAR/.config/fish/config.fish
chown $USERNAMEVAR.$USERNAMEVAR /home/$USERNAMEVAR/.config/fish/fish_variables


# install Brave Browser
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt -y install brave-browser


# install Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt update
apt -y install code


echo ""
echo ""
echo "All finished"
exit 0