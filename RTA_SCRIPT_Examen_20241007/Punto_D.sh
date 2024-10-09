#!/bin/bash
echo
echo "---------------------------------" 
echo "Estructura Asimetrica"
echo
mkdir -p /home/vagrant/Estructura_Asimetrica/{{correo,cliente}/cartas{1..100},correo/cartero{1..10}}


#tree /home/vagrant/Estructura_Asimetrica

tree /home/vagrant/Estructura_Asimetrica --noreport | pr -T -w 80 --column 4

echo "---------------------------------"
echo
