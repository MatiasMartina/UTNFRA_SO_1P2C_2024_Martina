#!/bin/bas#!/bin/bashh
PERMISO_LISTA=$1
#CARPETA,DUEÑO,GRUPO,PERMISOS
LISTA_USUARIOS_CARPETAS=$2


IFS=$'\n'


echo
echo "CAMBIO PERMISOS A /Examenes-UTN/ a 777"
echo "permisos antes:"
ls -ld /Examenes-UTN
sudo chmod 777 /Examenes-UTN/
echo
echo "--------------------------"
echo "permisos actuales"
ls -ld /Examenes-UTN/

#alumno1,/Examenes-UTN/alumno_1
#alumno2,/Examenes-UTN/alumno_2
#alumno3,/Examenes-UTN/alumno_3
#profesores,/Examenes-UTN/profesores

echo
echo "PERMISOS - PROPIETARIOS"
echo "-------------------------"


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




	echo "--------------------"
	echo
	echo "WHOAMI"
	echo "--------------------"

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


IFS=$ANT_IFS
