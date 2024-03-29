#!/bin/bash

# Script para eliminar proyecto dado el numero seleccionado por el usuario

cantLineas=`cat listaProyectos.txt | wc -l`
declare -i linea=-1

while [ $linea -gt $cantLineas -o $linea -lt 0 ]; do
        read -p "Escriba el numero de linea del proyecto a eliminar (0 para cancelar): " linea
        if [ $linea -gt $cantLineas -o $linea -lt 0 ]; then
                clear
                echo "Numero de linea incorrecto."
        fi
done


if [ $linea -eq 0 ]; then
        clear
else    
        echo "El proyecto seleccionado es: "
        echo `head -$linea listaProyectos.txt | tail -1`
        option=""
        read -p "Seguro que desea eliminarlo? (si/no): " option
        if [ $option == "si" -o $option == "Si" ]; then
                nombre=`head -$linea listaProyectos.txt | tail -1`
                rm -r "proyecto$nombre"
                declare -i lineas=`cat listaProyectos.txt | wc -l`
                lineas=$lineas-$linea
                linea=$linea-1
                if [ $linea -eq 0 ]; then
                        echo "`tail -$lineas listaProyectos.txt`" > aux.txt
                elif [ $lineas -eq 0 ]; then
                        echo "`head -$linea listaProyectos.txt`" > aux.txt
                else
                        echo -e "`head -$linea listaProyectos.txt`\n`tail -$lineas listaProyectos.txt`" > aux.txt
                fi
                mv aux.txt listaProyectos.txt
        fi
        clear
fi
