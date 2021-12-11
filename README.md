# TorchOS
an install script for Debian.

What does this do?
----------
  This contains an install script for Debian users to automate the install and setup for a Window Manager and preferences. The install script will launch apt and download the required packages to setup TorchOS. set variables needed, setup customizations, and change the shell from bash to fish.

What it includes.
----------
- fish(shell)
- st (terminal)
- dwm (window manager)
- chromium (primary browser)
- brave (secondary browser) (optional)
- git
- perl enviroment (optional)
- rust enviroment (optional)
- javajdk (lastest + lts) (optional)
- vscode
- eclipse (optional with java)
- vim

Install
---------
This installation guide assumes that you have installed debian without a desktop enviroment and have sudo configured.

go to your root folder and into the opt folder
`cd /opt/`

clone this repository with git
`sudo git clone https://github.com/GKFire/TorchOS.git`

run the debian_install script
`sudo ./debian_install`

read the onscreen prompts and follow them carefully, otherwise you may need to completly reinstall debian to restart this process.

logout or restart
`logout` or `exit` or `sudo systemctl reboot` or `sudo systemctl poweroff`

log back into your account.

start x
`startx`
  
Welcome to TorchOS
