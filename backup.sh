#!/bin/bash

#---------------------------------------
#
#	Autor: Marco Antoni
#	E-mail: marquinho9.10@gmail.com
#   Descriçao: Script para fazer backup 
#	para o HD externo
#
#---------------------------------------

function folderIsEmpty() {
	if [ `ls $1  | wc -l` -ne 0 ]; then
		return 1
	else
		return 0
	fi
}

## data
src_data="/media/marco/DADOS/"
dst_data="/media/marco/BKP/backup/"

## data cripto
src_data_cripto="/media/marco/Documentos/"
dst_data_cripto="/media/truecrypt1/"

## multimedia folder
src_music_folder=$src_data"Músicas/"
src_movies_folder_watched=$src_data"Filmes/Vistos/"
dst_movies_folder=$dst_data"Filmes/Vistos"

## log file
log_file=$dst_data"log_backup.txt"

$(folderIsEmpty $src_movies_folder_watched)

if [ $? -eq 1 ]; then
	echo "Movendo Filmes da pasta $src_movies_folder"
	cd $src_movies_folder_watched
	mv -v * $dst_movies_folder
fi


echo "Limpando arquivos da pasta musicas..."
find $src_music_folder -name "*.ini" -exec rm -rf {} \;
find $src_music_folder -name "*.jpg" -exec rm -rf {} \;
find $src_music_folder -name "*.jpeg" -exec rm -rf {} \;
find $src_music_folder -name "*.db" -exec rm -rf {} \;

echo "Iniciando transferencias..."
rsync -Cravp --exclude "Firefox" --exclude "Jogos" --exclude "Filmes" --exclude "System Volume Information" --exclude "RECYCLE" --exclude ".Trash-1000" $src_data $dst_data

echo  $src_data "->" $dst_data "sincronizado as" `date` >> $log_file

if [ "$1" == "s" ]; then
	$(folderIsEmpty $src_data_cripto)

	if [ $? -eq 0 ]; then
		bash montarParticaoTruecrypt.sh
	fi
	
	$(folderIsEmpty $dst_data_cripto)

	if [ $? -eq 1 ]; then
		echo "Sincronizando $src_data_cripto"
		rsync -Cravp --exclude ".Trash-1000" $src_data_cripto $dst_data_cripto
	fi
	

	echo $src_data_cripto "->" $dst_data_cripto "sincronizado" `date` >> $log_file
fi
