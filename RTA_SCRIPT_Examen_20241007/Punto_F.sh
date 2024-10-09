#!/bin/bash

printf "Mi IP pública es: %s\nMi usuario es: %s\nEl Hash de mi usuario es: %s\nLa URL de mi repositorio es: %s\n" "$(curl -s ifconfig.me | awk '{print $1}')" "$(whoami)" "$(sudo grep -i 'vagrant' /etc/shadow | awk -F ':' '{print $2}')" "$(git remote get-url origin)"


#printf "Mi ip publica es: %s\n Mi usuario es: %s \n El Hash de mi usuario es: %n""$(curl -s ifconfig.me | awk '{print $1}')" "$(whoami)" "$(sudo grep -i 'vagrant' /etc/shadow | awk -F ':' '{print $2}')" 
#curl -s ifconfig.me  | awk '{print $1}'
#whoami
#sudo grep -i "vagrant" /etc/shadow | awk -F ':' '{print $2}'

