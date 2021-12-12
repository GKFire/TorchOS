#!/bin/sh

echo "Beginning installation of TorchOS v1.0"
echo "Enter in your username to begin.."
read username_var


echo "Beginning installation of dependancies.."
apt -y install build-essential libx11-dev libxinerama-dev libxft-dev wget xinit xserver-xorg x11-server-utils \
		fish perl curl gcc cmake make vim \
		chromium nitrogen fonts-font-awesome


# echo "retrieving dwm from suckless.org"
# wget -q "https://dl.suckless.org/dwm/dwm-6.2.tar.gz"
# echo "retrieving st from suckless.org"
# wget -q "https://dl.suckless.org/st/st-0.8.4.tar.gz"
# echo "retrieving dmenu from suckless.org"
# wget -q "https://dl.suckless.org/tools/dmenu-5.0.tar.gz"

# echo "extracting archives"
# tar -xf dwm-6.2.tar.gz
# tar -xf st-0.8.4.tar.gz
# tar -xf dmenu-5.0.tar.gz

# echo "removing archives"
# rm *.tar.gz

echo "installing binaries"
cd dwm-6.2/
make clean install
cd ../slstatus/
make clean install
cd ../st-0.8.4/
make clean install
cd ../dmenu-5.0/
make clean install

echo "setting up .xinitrc"

# code for setting up .xinitrc at the user's home directory

echo "customizing TorchOS install"

# code for customization

echo "setting up programming enviroments"

# code for downloading programming language binaries

clear
echo "Would you like to have Rust installed on this machine?"
echo "'1': Yes"
echo "'0': No"
echo "(default value is 0, invaild responce will equal 0.)"
read install_rust

if [ "$install_rust" == "1" ]
then
	curl https://sh.rustup.rs -sSf | sh
fi

clear
echo "Would you like to have Perl installed on this machine?"
echo "'1': Yes"
echo "'0': No"
echo "(default value is 0, invaild responce will equal 0.)"
read install_perl

echo "$install_perl"
sleep 1000
if [ "$install_perl" == "1" ]
then
	apt -y install perl
fi

clear
echo "Would you like to have Java + Eclipse installed?"
echo "'1': Yes"
echo "'0': No"
echo "(default value is 0, invaild responce will equal 0.)"
echo "NOTE: this will install both the latest version and lts version of openjdk"
read install_java


if [ "$install_java" == "1" ]
then
	apt -y install openjdk-17-jdk openjdk-11-jdk

fi


exit 1
# code for setting up enviroments
# print what it did