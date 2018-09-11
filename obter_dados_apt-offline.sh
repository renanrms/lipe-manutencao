#!/bin/bash


# Este script se destina a obter os dados necessários para atualização e instalação offline dos programas mais usados pelo LIpE. Deve ser executado em uma máquina com sistema recém instalado e com mesma distribuição Linux dos computadores em que os dados de atualização e instalação serão usados.


# Adiciona o repositório de "parceiros" da Canonical.

sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"

# Atualiza os dados dos repositórios no computador

sudo apt-get update

# Baixa apt-offline com suas dependências e pacotes sugeridos

sudo rm -r apt-offline\ -\ debs
sudo mkdir apt-offline\ -\ debs
cd apt-offline\ -\ debs

PACOTES_APTOFFLINE="apt-offline debian-archive-keyring libpython-stdlib python python-defusedxml python-lzma python-minimal python-soappy python-wstools python2.7 python2.7-minimal python3-debianbts python3-magic python3-pycurl python3-pysimplesoap"
## para obter novamente a lista de pacotes acima é só executar "sudo apt-get install apt-offline" e depois cancelar a ação. A lista aparecerá na tela.
## alterar o porgrama para descobrir estas dependências em tempo real.

sudo apt-get download $PACOTES_APTOFFLINE
cd ..

# Para instalar o apt-offline

sudo dpkg -i -R --auto-deconfigure --skip-same-version --refuse-downgrade "apt-offline - debs"
sudo dpkg -a --configure

# Usando o apt-offline

### modificar o programa para incluir a distribuição, a versão e a arquitetura do sistema no nome dos arquivos para facilitar a organização. Podemos criar uma função que gera o nome e usá-la da mesma forma no programa que faz a atualização/instalação para escolher de forma automática entre vários arquivos pra sistemas diferentes.

LISTA_DE_PACOTES="ntp adobe-flashplugin wine-stable default-jre icedtea-netx synaptic vlc firefox libreoffice gedit tuxmath tuxpaint tuxtype squeak-vm scratch jclic idle3 arduino vim gedit geany"
sudo apt-offline set update-upgrade-install.sig --update --upgrade --install-packages $LISTA_DE_PACOTES
sudo apt-offline get --bundle update-upgrade-install.zip update-upgrade-install.sig

sudo rm update-upgrade-install.sig
