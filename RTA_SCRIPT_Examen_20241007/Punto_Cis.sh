#!/bin/bash

PERMISO_LISTA=$1
#CARPETA,DUEÑO,GRUPO,PERMISOS
IFS=$'\n'

echo "entro"

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
        sudo chown $PROPIETARIO:$GRUPO $DIRECTORIO
        sudo chmod $PERMISOS $DIRECTORIO
        
	echo "Permisos asignados a $DIRECTORIO"
	echo
  done

IFS=$ANT_IFS
