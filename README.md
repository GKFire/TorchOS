# TorchOS
an install script for Debian.

Heavy inspiration from sgomare's [featherOS](https://github.com/sgomare/featherOS). great project.

Dwm, st, dmenu, and slstatus were created by [suckless.org](https://suckless.org)

What does this do?
----------
This repository contains an install script for Debian users that automates the install and setup for dwm. The install script launchs apt and download the required packages to setup TorchOS. set variables needed, setup customizations, and change the shell from bash to fish.
  
**This is recommended for VMs. Not bare metal**

What it includes.
----------
- fish (shell)
- st (terminal)
- dwm (window manager)
- brave (browser)
- git
- rust enviroment (optional)
- javajdk (latest + lts) (optional)
- eclipse (optional with java)
- vim
- htop (WHAT?? a distro with htop preinstalled!?)
- neofetch
- vscode

Install
---------
This installation guide assumes that you have installed debian without a desktop enviroment and have sudo configured.

go to your root folder and into the opt folder
`cd /opt/`

clone this repository with git
`sudo git clone https://github.com/GKFire/TorchOS.git`

run the script
`sudo ./debian_install`

read the onscreen prompts and follow them carefully.

logout or restart
`logout` or `exit` or `sudo systemctl reboot` or `sudo systemctl poweroff`

log back into your account.

start x
`startx`
  
Welcome to TorchOS

(Possible) Future Features
---------
- utilize arguments for debian_install to skip input prompts
- generate xrandr script to auto fix screen resolution
