#!/bin/bash

# Script usado para anadir proyecto.

fechaInicial=`date` #
nombre=""
estado=""
fechaFinal=""

buscProy="."

clear

while [ "$buscProy" != "" ]; do
    read -p "Ingrese nombre del proyecto (no puede ser igual al nombre de otros proyectos): " nombre
    buscProy=`grep "$nombre" listaProyectos.txt`
    if [ "$buscProy" != "" ];then
        clear
        echo "El nombre del proyecto coincide con el nombre de otro proyecto."
    fi
done

clear
read -p "Ingrese estado: " estado

clear
read -p "Ingrese la fecha final: " fechaFinal

echo $nombre >> listaProyectos.txt
mkdir "proyecto$nombre"
echo -e "$nombre\n$fechaInicial\n$fechaFinal\n0\n$estado" > "proyecto$nombre/info.txt"

clear