#!/bin/bash

DISCO=$1

echo
echo "Particionamiento"
echo


sudo fdisk /dev/$DISCO << EOF
n
p
1

+1G
n
e



n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+900M
w
EOF

echo
echo "muestra particionamiento"
echo

sudo fdisk /dev/$DISCO -l



sudo mkfs.ext4 /dev/${DISCO}1
sudo mkfs.ext4 /dev/${DISCO}5
sudo mkfs.ext4 /dev/${DISCO}6
sudo mkfs.ext4 /dev/${DISCO}7
sudo mkfs.ext4 /dev/${DISCO}8
sudo mkfs.ext4 /dev/${DISCO}9
sudo mkfs.ext4 /dev/${DISCO}10
sudo mkfs.ext4 /dev/${DISCO}11
sudo mkfs.ext4 /dev/${DISCO}12
sudo mkfs.ext4 /dev/${DISCO}13


echo
echo "formateo a ext4"
echo
sudo lsblk /dev/$DISCO -f | grep -i "$DISCO" | awk '{printf("Disco %s: Formato: %s \n",$1,$2)}' | tail -n +2


echo
echo "Montaje persistente"
echo

# <dispositivo> <dir> <tipo>   <opciones> <dump> <fsck>

"/dev/${DISCO}1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}5 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}6 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}7 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}8 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}9 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}10 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}11 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
"/dev/${DISCO}12 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab

df -h | grep -i "$DISCO" | awk '{printf("Filesystem: %s - Mounted on: %s \n",$1,$6)}'



