# TorchOS
an install script for Debian.

What does this do?
----------
  This contains an install script for Debian users to automate the install and setup for a Window Manager and preferences. The install script will launch apt and download the required packages to setup TorchOS. set variables needed, setup customizations, and change the shell from bash to zsh.

What it includes.
----------
- zsh (shell)
- st (terminal)
- dwm (window manager)
- chromium (primary browser)
- brave (secondary browser)
- git
- perl enviroment
- rust enviroment
- java (choice of openjdk or oracle)

Install
---------
This installation guide assumes that you have installed debian without a desktop enviroment and have sudo configured.

1.
  go to your root folder and into the opt folder
  `cd /opt/`
2.
  clone this repository with git
  `sudo git clone https://github.com/GKFire/TorchOS.git`
3.
  run the debian_install script
  `sudo ./debian_install`
4.
  read the prompts and follow them carefully, otherwise you may need to completly reinstall debian to restart this process.
5.
  logout or restart
  `logout` or `exit` or `sudo systemctl reboot` or `sudo systemctl poweroff`
6.
  log back into your account.
7.
  start x
  `startx`
Welcome to TorchOS
