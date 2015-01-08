#! /bin/bash

#---------------------------------------
#
#	Autor: Marco Antoni
#	E-mail: marquinho9.10@gmail.com
#   Descriçao: Script para montar uma
#	particao criptografada pelo
#	truecrYpt
#
#---------------------------------------

dispositivo="/dev/sda4"
pontodemontagem="/media/marco/Documentos"

senhaAdm=`zenity --password --title="O script precisa de permissão de administrador"`
senhaDispositivo=`zenity --password --title="Insira a senha do dispositivo $dispositivo"`


echo -e $senhaAdm"\n" | sudo -S truecrypt -t --mount $dispositivo $pontodemontagem --non-interactive -p $senhaDispositivo
