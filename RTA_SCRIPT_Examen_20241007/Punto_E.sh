#!/bin/bash
echo
echo "---------------------------------"
echo "Generando Filtro_Basico.txt"

grep -i "memtotal" /proc/meminfo >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
echo > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
#echo >>/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
sudo dmidecode -t chassis | grep -i chassis >>/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
#echo >>/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
sudo dmidecode -t chassis | grep -i oracle >>/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt

cat /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Martina/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
echo
echo "---------------------------------"
echo
