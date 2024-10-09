#!/bin/bash
echo
echo "---------------------------------"
echo "generando Filtrado_Avanzado.txt" 
echo
printf "Mi IP publica es: %s\nMi usuario es: %s\nEl Hash de mi usuario es: %s\nLa URL de mi repositorio es: %s\n" "$(curl -s ifconfig.me | awk '{print $1}')" "$(whoami)" "$(sudo grep -i 'vagrant' /etc/shadow | awk -F ':' '{print $2}')" "$(git remote get-url origin)" > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
cat /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
echo
echo "---------------------------------"
#printf "Mi ip publica es: %s\n Mi usuario es: %s \n El Hash de mi usuario es: %n""$(curl -s ifconfig.me | awk '{print $1}')" "$(whoami)" "$(sudo grep -i 'vagrant' /etc/shadow | awk -F ':' '{print $2}')" 

#(git remote get-url origin
#IP -> curl -s ifconfig.me  | awk '{print $1}'
#usuario --> whoami
#hash --> sudo grep -i "vagrant" /etc/shadow | awk -F ':' '{print $2}'

