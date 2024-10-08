#!/bin/bash

echo
echo "Para ejecutar:   ./1_for_lista.sh  2_for_cmd_lista.txt"
echo

LISTA=$1

ANT_IFS=$IFS

IFS=$'\n' #Caracter que usa el for para dar cada vuelta




for LINEA in `cat $LISTA |  grep -v ^#` 

do
	USUARIO=$(echo  $LINEA |awk -F ',' '{print $1}')
	GRUPO=$(echo  $LINEA |awk -F ',' '{print $2}')
	
	if [ $(grep "$GRUPO:" /etc/group -c) -eq 0 ]; then
   		sudo groupadd $GRUPO
 		echo"grupo $GRUPO creado"
	else
	    echo "el grupo $GRUPO ya existe"
	fi
	
	
	sudo useradd -m -s /bin/bash -G $GRUPO $USUARIO

done
IFS=$ANT_IFS











