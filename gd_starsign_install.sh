#!/bin/bash
# Script to install Token GD Starsign tested only ubuntu 22.04

sudo apt install pcscd libccid libjbig0 libpcsclite1 opensc -y
sudo apt install libgdk-pixbuf2.0-0 -y
sudo apt install libwxbase3.0-0v5 libwxgtk3.0-gtk3-0v5 -y
cd ~/Downloads
mkdir gd_starsign
cd gd_starsign
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb https://safesign.gdamericadosul.com.br/content/SafeSign_IC_Standard_Linux_3.7.0.0_AET.000_ub2004_x86_64.rar 
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb
file-roller -h SafeSign_IC_Standard_Linux_3.7.0.0_AET.000_ub2004_x86_64.rar
sudo dpkg -i SafeSign_IC_Standard_Linux_3.7.0.0_AET.000_ub2004_x86_64.deb
systemctl start pcscd.service
systemctl enable pcscd.service
tokenadmin
