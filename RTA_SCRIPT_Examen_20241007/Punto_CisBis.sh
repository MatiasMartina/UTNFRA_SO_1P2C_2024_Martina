#!/bin/bash

LISTA_USUARIOS_CARPETAS=$1



#alumno1,/Examenes-UTN/alumno_1
#alumno2,/Examenes-UTN/alumno_2
#alumno3,/Examenes-UTN/alumno_3
#profesores,/Examenes-UTN/profesores

IFS=$'\n'
for LINEA in `cat "$LISTA_USUARIOS_CARPETAS" | grep -v ^#`
do
	echo "Linea: $LINEA"
	USUARIO=$(echo $LINEA | awk -F ',' '{print $1}')
	DIRECTORIO=$(echo $LINEA | awk -F ',' '{print $2}')
	
	echo
	echo "--------------------"
	echo

	#DIRECTORIO,USUARIO
	echo "directorios creados"
	#sudo su -c "whoami" > ./probando.txt p1c2_2024_A1
	sudo su -c "whoami" > "$DIRECTORIO"/validar.txt $USUARIO
done


IFS=$ANT_IFS


