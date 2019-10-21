#!/bin/bash

# Script para eliminar empleado dado el numero seleccionado por el usuario

cantLineas=`cat listaEmpleados.txt | wc -l`
declare -i linea=-1

while [ $linea -gt $cantLineas -o $linea -lt 0 ]; do
        read -p "Escriba el numero de linea del empleado a eliminar (0 para cancelar): " linea
        if [ $linea -gt $cantLineas -o $linea -lt 0 ]; then
                clear
                echo "Numero de linea incorrecto."
        fi
done

if [ $linea -eq 0 ]; then
        clear
else    
        echo "El empleado seleccionado es: "
        echo `head -$linea listaEmpleados.txt | tail -1`
        option=""
        echo "Detalle importante: si se asigno este empleado a algun proyecto, debe desasignarlo personalmente."
        read -p "Seguro que desea eliminarlo? (si/no): " option
        if [ $option == "si" -o $option == "Si" ]; then
                declare -i lineas=`cat listaEmpleados.txt | wc -l`
                lineas=$lineas-$linea
                linea=$linea-1
                echo "`head -$linea listaEmpleados.txt``tail -$lineas listaEmpleados.txt`" > aux.txt
                mv aux.txt listaEmpleados.txt
        fi
        #clear
fi

clear
