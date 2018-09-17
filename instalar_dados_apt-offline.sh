#!/bin/bash


# Este script atualiza o sistema e instala os programas mais usados pelo LIpE. Deve ser executado em uma máquina com a mesma distribuição Linux dos computadores em que os dados de atualização e instalação foram obtidos.


LISTA_DE_PACOTES="ntp adobe-flashplugin wine-stable default-jre icedtea-netx synaptic gparted vlc firefox libreoffice gedit tuxmath tuxpaint tuxtype squeak-vm scratch jclic idle3 arduino vim gedit geany"
sudo apt-offline install update-upgrade-install.zip
sudo apt-get upgrade
sudo apt-get install $LISTA_DE_PACOTES

### INSERIR O RESTO DO SCRIPT, REALIZANDO INSTALAÇÃO E CONFIGURAÇÃO DE TUDO.
