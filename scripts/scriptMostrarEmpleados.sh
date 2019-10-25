#!/bin/bash

# Script utilizado para mostrar todos los empleados.

clear
echo -e "Nombre y apellido : Cedula de identidad : Cargo : Telefono"
declare -i lineas=`cat listaEmpleados.txt | wc -l`
declare -i i=1
while [ $i -le $lineas ]
do
    echo "$i. `head -$i listaEmpleados.txt | tail -1`"
    i=$i+1
done

read -p "Aplasta enter para continuar"
clear