#!/bin/bash

# Variáveis das Urls padrão do debian e do ubuntu
	debian_url=http://ftp.us.debian.org/debian/pool/main
	ubuntu_url=http://security.ubuntu.com/ubuntu/pool/main
	ubuntu_archive_url=http://archive.ubuntu.com/ubuntu/pool/universe
	ubuntu_archive_main_url=http://archive.ubuntu.com/ubuntu/pool/main/o/openssl
	
# libs que não tem nos repositórios padrão do Ubuntu
# Variáveis dos arquivos .deb
	# libjpeg62_turbo_=libjpeg62-turbo_2.1.5-2+b2_amd64.deb
	libjpeg62_turbo_=libjpeg62-turbo_2.1.5-3_amd64.deb
	libssl1_1_=libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb	
	libtiff5_=libtiff5_4.1.0+git191117-2ubuntu0.20.04.13_amd64.deb
	libwebp6_=libwebp6_0.6.1-2ubuntu0.20.04.3_amd64.deb
	libwxbase3_0_=libwxbase3.0-0v5_3.0.5.1+dfsg-4_amd64.deb
	libwxgtk3_0_=libwxgtk3.0-gtk3-0v5_3.0.5.1+dfsg-4_amd64.deb
	
# Variáveis dos links de download das libs .deb
	libjpeg62_turbo=$debian_url/libj/libjpeg-turbo/$libjpeg62_turbo_
	libssl1_1=$ubuntu_archive_main_url/$libssl1_1_
	libtiff5=$ubuntu_url/t/tiff/$libtiff5_
	libwebp6=$ubuntu_url/libw/libwebp/$libwebp6_
	libwxbase3_0=$ubuntu_archive_url/w/wxwidgets3.0/$libwxbase3_0_
	libwxgtk3_0=$ubuntu_archive_url/w/wxwidgets3.0/$libwxgtk3_0_

# Aquivo Safesign baixado e descompactado
	safesign_url=https://safesign.gdamericadosul.com.br/content
	safesign_rar=SafeSign_IC_Standard_Linux_3.7.0.0_AET.000_ub2004_x86_64.rar  
	# safesign_zip=SafeSign_IC_Standard_Linux_ub2204_3.8.0.0_AET.000.zip
	safesign_dl=$safesign_url/$safesign_rar
	# safesign_deb=SafeSign\ IC\ Standard\ Linux\ 3.8.0.0-AET.000\ ub2204\ x86_64.deb
	safesign_deb=SafeSign_IC_Standard_Linux_3.7.0.0_AET.000_ub2004_x86_64.deb

# Instalando as bibliotecas que já tem nos repositórios padrão do ubuntu
	sudo apt install opensc libgdk-pixbuf2.0-0 -y

# Baixando as bibliotecas que não tem nos repositórios padrão do ubuntu
	mkdir ~/Downloads/token_gd_starsign && cd ~/Downloads/token_gd_starsign
	wget $libjpeg62_turbo $libssl1_1 $libtiff5 $libwebp6 $libwxbase3_0 $libwxgtk3_0 $safesign_dl

# Instalando as bibliotecas que não tem nos repositórios padrão do ubuntu
	sudo dpkg -i $libwebp6_ $libtiff5_ $libjpeg62_turbo_ $libwxbase3_0_ $libwxgtk3_0_ $libssl1_1_

# Descompactando e instalando o safesign
	#unzip -o $safesign_zip
	file-roller -h $safesign_rar
	
	rm $safesign_rar	
	sudo dpkg -i SafeSign_IC_Standard_Linux_3.7.0.0_AET.000_ub2004_x86_64.deb
	# sudo dpkg -i SafeSign\ IC\ Standard\ Linux\ 3.8.0.0-AET.000\ ub2204\ x86_64.deb

# Iniciando e habilitando o serviço pcscd
	systemctl start pcscd.service
	systemctl enable pcscd.service

# Verificando se o token foi reconhecido
	tokenadmin
