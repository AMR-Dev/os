#!/bin/bash

# Script utilizado para mostrar todos los proyectos.

clear
declare -i lineas=`cat listaProyectos.txt | wc -l`
declare -i i=1
while [ $i -le $lineas ]
do
    echo "$i. `head -$i listaProyectos.txt | tail -1`"
    i=$i+1
done
read -p "Aplasta enter para continuar"
clear