#!/bin/bash

# Script para editar empleado dado el numero seleccionado por el usuario

declare -i lineas=`cat listaEmpleados.txt | wc -l`
declare -i linea=-1

while [ $linea -gt $lineas -o $linea -lt 0 ]; do
        read -p "Escriba el numero de linea del empleado a modificar (0 para cancelar): " linea
        if [ $linea -gt $cantLineas -o $linea -lt 0 ]; then
                clear
                echo "Numero de linea incorrecto."
        fi
done

if [ $linea -eq 0 ]; then
        clear
else
        nomApe=""
        ci=""
        cargo=""
        tel=""

        clear
        echo "El empleado seleccionado es: "
        echo `head -$linea listaEmpleados.txt | tail -1`
        read -p "Ingrese el nombre completo del empleado: " nomApe

        clear
        echo "El empleado seleccionado es: "
        echo `head -$linea listaEmpleados.txt | tail -1`
        read -p "Ingrese la cedula de identidad del empleado: " ci

        clear
        echo "El empleado seleccionado es: "
        echo `head -$linea listaEmpleados.txt | tail -1`
        read -p "Ingrese el cargo del empleado: " cargo

        clear
        echo "El empleado seleccionado es: "
        echo `head -$linea listaEmpleados.txt | tail -1`
        read -p "Ingrese el telefono empleado: " tel

        clear
        echo "El empleado seleccionado es: "
        echo `head -$linea listaEmpleados.txt | tail -1`
        nuevoEmpleado=`echo $nomApe ":" $ci ":" $cargo ":" $tel`
        echo "El empleado modificado es:"
        echo $nuevoEmpleado
        option=""
        read -p "Seguro que desea modificarlo? (si/no): " option
        if [ $option == "si" -o $option == "Si" ]; then
                declare -i lineas=`cat listaEmpleados.txt | wc -l`
                lineas=$lineas-$linea
                linea=$linea-1
                echo -e "`head -$linea listaEmpleados.txt`$nuevoEmpleado\n`tail -$lineas listaEmpleados.txt`" > aux.txt
                mv aux.txt listaEmpleados.txt
        fi
        
        clear

fi
