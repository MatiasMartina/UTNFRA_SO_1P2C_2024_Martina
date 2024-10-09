#!/bin/bash





LISTA=$1
USER_HASH=$2


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


PERMISO_LISTA=$3
#CARPETA,DUEÑO,GRUPO,PERMISOS
LISTA_USUARIOS_CARPETAS=$4


IFS=$'\n'

#alumno1,/Examenes-UTN/alumno_1
#alumno2,/Examenes-UTN/alumno_2
#alumno3,/Examenes-UTN/alumno_3
#profesores,/Examenes-UTN/profesores

for LINEA in `cat "$LISTA_USUARIOS_CARPETAS" | grep -v ^#`
do
        echo
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
	echo "--------------------"
done




for LINEA_PERMISO in `cat $PERMISO_LISTA | grep -v ^#`
do
    echo "Linea permiso: $LINEA_PERMISO"
    DIRECTORIO=$(echo $LINEA_PERMISO | awk -F ',' '{print $1}')
    PROPIETARIO=$(echo $LINEA_PERMISO | awk -F ',' '{print $2}')
    GRUPO=$(echo $LINEA_PERMISO | awk -F ',' '{print $3}')
    PERMISOS=$(echo $LINEA_PERMISO | awk -F ',' '{print $4}')
    echo
    echo "----------------------------------------------------"
    echo

        echo "Asignando permisos a $DIRECTORIO"
        sudo chown -R $PROPIETARIO:$GRUPO $DIRECTORIO
        sudo chmod -R $PERMISOS $DIRECTORIO

        echo "Permisos asignados a $DIRECTORIO"
        echo
  done




IFS=$ANT_IFS










