#!/bin/bash

echo "Beginning installation of TorchOS v1.0"
echo "Enter in your username to begin.."
read usernamevar

if id "$usernamevar" &>/dev/null; then
    echo 'valid username'
else
    echo "That user doesn't exist"
	exit -1
fi

echo "Beginning installation of dependancies.."
apt update
apt -y install build-essential libx11-dev libxinerama-dev libxft-dev wget xinit xserver-xorg x11-xserver-utils compton \
	fish perl curl gcc cmake make vim htop neofetch apt-transport-https \
	chromium nitrogen fonts-font-awesome


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

echo "setting up .xinitrc"
cp .xinitrc /home/$usernamevar/.xinitrc
chown $usernamevar.$usernamevar /home/$usernamevar/.xinitrc


echo "customizing TorchOS install"
chsh -s /bin/fish $usernamevar
mkdir /home/$usernamevar/Pictures
mkdir /home/$usernamevar/Pictures/Wallpapers
mkdir /home/$usernamevar/Music
mkdir /home/$usernamevar/Documents
mkdir /home/$usernamevar/Downloads
mkdir /home/$usernamevar/Development

mkdir /home/$usernamevar/.config
cp -ur .config/fish /home/$usernamevar/.config/


# code for downloading programming language binaries

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg


apt update
apt -y install code




# install Rust
clear
echo "Would you like to have Rust installed on this machine?"
echo "'1': Yes"
echo "'0': No"
echo "(default value is 0, invaild responce will equal 0.)"
read installRust

if [ "$installRust" == "1" ]
then
	curl https://sh.rustup.rs -sSf | sh
fi


# install Java and Eclipse as its IDE
clear
echo "Would you like to have Java + Eclipse installed on this machine?"
echo "'1': Yes"
echo "'0': No"
echo "(default value is 0, invaild responce will equal 0.)"
echo "NOTE: this will install both the latest version and lts version of openjdk. (Latest: openjdk-17 | LTS: openjdk-17)"
read installJava


if [ "$installJava" == "1" ]
then
	apt -y install openjdk-17-jdk
	cd /usr/share/
	wget https://mirrors.jevincanders.net/eclipse/technology/epp/downloads/release/2021-12/R/eclipse-java-2021-12-R-linux-gtk-x86_64.tar.gz
	tar -xvf eclipse-java-2021-12-R-linux-gtk-x86_64.tar.gz
	rm eclipse-java-2021-12-R-linux-gtk-x86_64.tar.gz
	mv eclipse-java-2021-12-R-linux-gtk-x86_64 eclipse
	cd /opt/TorchOS/
fi

clear
echo "Would you like to install Brave Browser?"
echo "'1': Yes"
echo "'0': No"
echo "(default value is 0, invaild responce will equal 0.)"
read installBrave

if [ "$installBrave" == "1" ]
then
	curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list
	apt update
	apt -y install brave-browser
fi





clear
echo "All finished"

exit 0
