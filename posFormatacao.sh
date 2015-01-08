#!/bin/bash

#---------------------------------------
#
#	Autor: Marco Antoni
#	E-mail: marquinho9.10@gmail.com
#   Descriçao: Script pos formatacao
#	instalacao de aplicativos usados
#
#---------------------------------------

sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:webupd8team/nemo

sudo apt-get update

sudo apt-get install oracle-java8-installer -y
sudo apt-get install cairo-dock nemo gparted vim -y
sudo apt-get install unity-tweak-tool -y
sudo apt-get install compizconfig-settings-manager compiz-plugins-extra -y
sudo apt-get install keepassx -y
sudo apt-get install wine -y
sudo apt-get install git -y



sudo apt-get install grub2 -y
sudo update-grub2

echo "Definindo nemo como gerenciador de janelas"
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
