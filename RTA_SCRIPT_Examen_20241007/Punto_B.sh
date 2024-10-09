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
echo "----------------------------"

sudo fdisk /dev/$DISCO -l
echo 
echo "----------------------------"
echo 
sudoo mkfs.ext4 /dev/${DISCO}1
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

#├─sdc1  175bb664-447f-42e6-8078-5b34bdc5f5c9
#├─sdc2
#├─sdc5  3d122432-b1a0-4652-b67f-726c519cec9f
#├─sdc6  7036879e-3c6e-4993-ad41-0bcd6c6cda41
#├─sdc7  c2f810e0-52ed-45d6-9a6b-e6d50fcbc045
#├─sdc8  d20794b6-48f1-45f0-89f8-9e8b4715b687
#├─sdc9  ae11e518-5b03-48e5-b297-0cf844a12f73
#├─sdc10 c71ecb53-47bb-4b38-add9-56e037ac5592
#├─sdc11 fc1d1385-f276-4cd1-bf2d-6cf7843a3f64
#├─sdc12 a02c1e9e-ffa2-4124-9396-b20b7abbee8e
#└─sdc13 895bd435-5a16-4870-966e-b283ce4dbad3
echo "--------------------------"
echo
echo "Montaje persistente"
echo

# <dispositivo> <dir> <tipo>   <opciones> <dump> <fsck>

echo "/dev/${DISCO}1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}5 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}6 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}7 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}8 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}9 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}10 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}11 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}12 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/${DISCO}13 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mount -a
echo



df -h | grep -i "$DISCO" | awk '{printf("Filesystem: %s - Mounted on: %s \n",$1,$6)}'
echo
echo "---------------------------"
