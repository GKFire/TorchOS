# TorchOS
an install script for Debian.

Heavy inspiration from sgomare's [featherOS](https://github.com/sgomare/featherOS). great project.

Dwm, st, dmenu, and slstatus were created by [suckless](https://suckless.org)

What does this do?
----------
  This contains an install script for Debian users to automate the install and setup for dwm. The install script will launch apt and download the required packages to setup TorchOS. set variables needed, setup customizations, and change the shell from bash to fish.

What it includes.
----------
- fish (shell)
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

read the onscreen prompts and follow them carefully.

logout or restart
`logout` or `exit` or `sudo systemctl reboot` or `sudo systemctl poweroff`

log back into your account.

start x
`startx`
  
Welcome to TorchOS

Issues
-------
- execute permissions are not set properly. (working on fixing this. The reason is that i am currently developing this on Windows 10 that does not have good permission translation to linux. Will get a linux dev machine setup to fix this issue)
- this doesn't setup xinit. (yep. haven't gotten around to that yet)
