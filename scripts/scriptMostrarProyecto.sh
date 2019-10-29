#!/bin/bash

# Script para mostrar el proyecto dado el numero seleccionado por el usuario

cantLineas=`cat listaProyectos.txt | wc -l`
linea=-1

clear
while [ $linea -gt $cantLineas -o $linea -lt 0 ]; do
        read -p "Escriba el numero de linea del proyecto a mostrar (0 para cancelar): " linea
        if [ $linea -gt $cantLineas -o $linea -lt 0 ]; then
                clear
                echo "Numero de linea incorrecto."
        fi
done

if [ $linea -ne 0 ]; then
        clear
        nombre=`head -$linea listaProyectos.txt | tail -1`
        echo "Nombre del proyecto:" `head -1 "proyecto$nombre/info.txt" | tail -1`
        echo "Fecha inicial:" `head -2 "proyecto$nombre/info.txt" | tail -1`
        echo "Fecha final:" `head -3 "proyecto$nombre/info.txt" | tail -1`
        echo "Cantidad de empleados:" `cat "proyecto$nombre/empleados.txt" | wc -l`
        echo "Estado:" `head -5 "proyecto$nombre/info.txt" | tail -1`

        read -p "Aplasta enter para continuar"
fi
clear