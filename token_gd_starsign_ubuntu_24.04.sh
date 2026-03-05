#!/bin/bash

###########################################################
################# Safesign Linux Installer ################
###########################################################
	
# Instalador do Certificado digital no Ubuntu e derivados.
	
# Página oficial de download do Safesign:
# https://safesign.gdamericadosul.com.br/
	
# Github deste Programa:
# https://github.com/BassHero/gd_starsign_driver
	
# Autor: Renato Ramalho
# email para contato: renatoramalho1986@gmail.com
	
# Caso queria me fazer uma doação:

# PIX: renatoramalho232@gmail.com

# Bitcoin(bipatag): $renatoramalho

# Bitcoin: bc1qx2mm6d4uxt72czrwpk8xh73vavzt2kmxcuwx7l

# Bitcoin(lighting):
	# lnbc1p5clyfppp5q5fgduca0gnkluypaq7dj3nlmdvnkwvg5z8rv2lagrda4as79q3qdqqcqzzsxqrrsssp56jmjfydk8hs2erm4d02k0mc9kye79slmtdnhxk64m37zmwhy3mhs9qxpqysgq9v20kv6ympgtpz3uzmkfclzf3nszvysj8d46gxqwv7ew9vy0jlf8sv0sw4jx4mwxce0z8adgjk4tycs9cuc36qe6vejzcp9xy00rq2cpnu32c3
	
###########################################################
###########################################################
###########################################################

# Lista de arquivos.

LIBWEBP6=libwebp6_0.6.1-2.1+deb11u2_amd64.deb
LIBTIFF5=libtiff5_4.2.0-1+deb11u7_amd64.deb
LIBJPEG62=libjpeg62-turbo_2.1.5-4_amd64.deb
LIBWXBASE=libwxbase3.0-0v5_3.0.5.1+dfsg-2_amd64.deb
LIBWXGTK=libwxgtk3.0-gtk3-0v5_3.0.5.1+dfsg-2_amd64.deb
LIBSSL1=libssl1.1_1.1.1w-0+deb11u5_amd64.deb
SAFESIGN=SafeSign_IC_Standard_Linux_3.7.0.0_AET.000_ub2004_x86_64.rar
SAFESIGN_DEB=SafeSign_IC_Standard_Linux_3.7.0.0_AET.000_ub2004_x86_64.deb

# Links pra baixar os arquivos.

LIBWEBP6_URL=http://ftp.us.debian.org/debian/pool/main/libw/libwebp/$LIBWEBP6
LIBTIFF5_URL=http://security.debian.org/debian-security/pool/updates/main/t/tiff/$LIBTIFF5
LIBJPEG62_TURBO_URL=http://ftp.us.debian.org/debian/pool/main/libj/libjpeg-turbo/$LIBJPEG62
LIBWXBASE_URL=http://ftp.us.debian.org/debian/pool/main/w/wxwidgets3.0/$LIBWXBASE
LIBWXGTK_URL=http://ftp.us.debian.org/debian/pool/main/w/wxwidgets3.0/$LIBWXGTK
LIBSSL1_URL=http://security.debian.org/debian-security/pool/updates/main/o/openssl/$LIBSSL1
SAFESIGN_URL=https://safesign.gdamericadosul.com.br/content/$SAFESIGN

# Funções

instalar_safesing () {

	# Instalando as bibliotecas que estão nos repositórios padrão do Ubuntu.
	sudo apt install pcscd libgdk-pixbuf2.0-0 unrar -y

	# Baixando as bibliotecas que estão nos repositórios padrão do Ubuntu e o Safesign.
	wget -nc $LIBWEBP6_URL $LIBTIFF5_URL $LIBJPEG62_TURBO_URL $LIBWXBASE_URL $LIBWXGTK_URL $LIBSSL1_URL $SAFESIGN_URL

	# Instalando as bibliotecas baixadas.
	sudo dpkg -i $LIBWEBP6 $LIBTIFF5 $LIBJPEG62_TURBO $LIBWXBASE $LIBWXGTK $LIBSSL1

	# Extraindo e instalando o safesign
	unrar x $SAFESIGN
	sudo dpkg -i $SAFESIGN_DEB	

	# Iniciando e habilitando o serviço pcscd
	systemctl start pcscd.service
	systemctl enable pcscd.service

	# Iniciando o token e verificando se foi reconhecido
	tokenadmin
}

remover_arquivos () {

	# Deletando arquivos baixados.
	rm $LIBWEBP6 $LIBTIFF5 $LIBJPEG62_TURBO $LIBWXBASE $LIBWXGTK $LIBSSL1 $SAFESIGN $SAFESIGN_DEB
}

# Mensagem inicial de Execução

echo "
	###########################################################
	################# Safesign Linux Installer ################
	###########################################################
	
	Instalador do Certificado digital no Ubuntu e derivados.
	
	Página oficial de download do Safesign:
	https://safesign.gdamericadosul.com.br/
	
	Github deste Programa:
	https://github.com/BassHero/gd_starsign_driver
	
	Autor: Renato Ramalho
	email para contato: renatoramalho1986@gmail.com
	
	Caso queria me fazer uma doação:

	PIX: renatoramalho232@gmail.com  

	Bitcoin(bipatag): $renatoramalho

	Bitcoin: bc1qx2mm6d4uxt72czrwpk8xh73vavzt2kmxcuwx7l

	Bitcoin(lighting):
		lnbc1p5clyfppp5q5fgduca0gnkluypaq7dj3nlmdvnkwvg5z8rv2lagrda4as79q3qdqqcqzzsxqrrsssp56jmjfydk8hs2erm4d02k0mc9kye79slmtdnhxk64m37zmwhy3mhs9qxpqysgq9v20kv6ympgtpz3uzmkfclzf3nszvysj8d46gxqwv7ew9vy0jlf8sv0sw4jx4mwxce0z8adgjk4tycs9cuc36qe6vejzcp9xy00rq2cpnu32c3

===========================================================================

	
	###########################################################
	###########################################################
	###########################################################
"

read -p "Deseja instalar o Safesign? [s/n] " RESPOSTA1
read -p "Deseja remover os arquivos baixados após a instalação? [s/n] " RESPOSTA2

if [ "$RESPOSTA1" == "s" ]; then	
	instalar_safesing
	echo 
else
	echo "Execute o instalador novamente caso necessário."
fi

if [ "$RESPOSTA2" == "s" ]; then	
	remover_arquivos 
	echo "Os arquivos foram removidos"
else
	echo "Nenhum arquivo baixado foi removido."
	echo "Execute o instalador novamente caso queira removê-los por aqui."
fi


