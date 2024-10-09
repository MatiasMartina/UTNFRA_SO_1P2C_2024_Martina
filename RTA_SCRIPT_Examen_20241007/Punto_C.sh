#!/bin/bash





LISTA=$1
USER_HASH=$2
LISTA_PERMISOS=$3
HASH=$(sudo grep -i $USER_HASH /etc/shadow | awk -F ':' '{print $2}' )
#echo "$HASH"
#exit 1
ANT_IFS=$IFS

IFS=$'\n' #Caracter que usa el for para dar cada vuelta




for LINEA in `cat $LISTA |  grep -v ^#` 

do
	echo "Linea: $LINEA"
	echo
	USUARIO=$(echo  $LINEA |awk -F ',' '{print $1}')
	GRUPO=$(echo  $LINEA |awk -F ',' '{print $2}')
	
	if [ $(grep "$GRUPO:" /etc/group -c) -eq 0 ]; then
   		
		sudo groupadd $GRUPO
 		
		echo "grupo $GRUPO creado"
	else
	    echo "el grupo $GRUPO ya existe"
	fi
	
	if [ $(grep "$USUARIO" /etc/passwd -c) -eq 0 ]; then

	
		sudo useradd -m -p "$HASH" -s /bin/bash -G $GRUPO $USUARIO
		echo "----------------------------------------------"
	else	
		echo "el usuario $USUARIO ya existe"
	fi
done
IFS=$ANT_IFS











