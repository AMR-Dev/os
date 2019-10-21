#!/bin/bash

# Script para mostrar los empleados de un proyecto

declare -i lineas=`cat listaProyectos.txt | wc -l`
declare -i linea=-1

if [ $1 ]; then
        linea=$1
else
        while [ $linea -gt $lineas -o $linea -lt 0 ]; do
                read -p "Escriba el numero de linea del proyecto (0 para cancelar): " linea
                if [ $linea -gt $lineas -o $linea -lt 0 ]; then
                        clear
                        echo "Numero de linea incorrecto."
                fi
        done
fi

if [ $linea -ne 0 ]; then
        clear
        proyecto=`head -$linea listaProyectos.txt | tail -1`
        declare -i lineasEmpleado=`cat "proyecto$proyecto/empleados.txt" | wc -l`
        declare -i i=1
        while [ $i -le $lineasEmpleado ]
        do
                echo "$i. `head -$i proyecto$proyecto/empleados.txt | tail -1`"
                i=$i+1
        done
        read -p "Aplaste enter para continuar"
fi

clear