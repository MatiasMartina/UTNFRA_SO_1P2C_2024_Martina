#!/bin/bash
LISTA_USUARIOS_CARPETAS=$1

ANT_IFS=$IFS
IFS=$'\n'


	echo "--------------------"
        echo
        echo "WHOAMI"
        echo "--------------------"
	
	echo "entra"
#       sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1
#       sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
#       sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
#       sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1


#for LINEA in `cat $LISTA_USUARIOS_CARPETAS | grep -v ^#`
	#do
for LINEA in `cat $LISTA_USUARIOS_CARPETAS | grep -v ^#`
do
	echo "entra2"
        echo
        echo "Linea: $LINEA"
       DIRECTORIO=$(echo $LINEA | awk -F ',' '{print $1}')
       USUARIO=$(echo $LINEA | awk -F ',' '{print $2}')

        echo
        echo "--------------------"
        echo

 #DIRECTORIO,USUARIO
        echo "directorios creados"
	#sudo su -c "whoami" > ./probando.txt p1c2_2024_A1
	echo "esto es una prueba"
        sudo su -c "whoami > $DIRECTORIO/validar.txt" $USUARIO
       echo "--------------------"
done


IFS=$ANT_IFS

