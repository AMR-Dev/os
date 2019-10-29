#!/bin/bash

# Script para desasignar un empleado a un proyecto

declare -i lineasProyecto=`cat listaProyectos.txt | wc -l`
declare -i lineaProyecto=-1

while [ $lineaProyecto -gt $lineasProyecto -o $lineaProyecto -lt 0 ]; do
        read -p "Escriba el numero de linea del proyecto (0 para cancelar): " lineaProyecto
        if [ $lineaProyecto -gt $lineasProyecto -o $lineaProyecto -lt 0 ]; then
                clear
                echo "Numero de linea incorrecto."
        fi
done

if [ $lineaProyecto -ne 0 ]; then
        clear
        nombreProyecto=`head -$lineaProyecto listaProyectos.txt | tail -1`
        declare -i lineasEmpleado=`cat "proyecto$nombreProyecto/empleados.txt" | wc -l`
        ./scriptMostrarEmpleadosDeProyecto.sh $lineaProyecto

        declare -i lineaEmpleado=-1

        while [ $lineaEmpleado -gt $lineasEmpleado -o $lineaEmpleado -lt 0 ]; do
                read -p "Escriba el numero de linea del empleado a desasignar (0 para cancelar): " lineaEmpleado
                if [ $lineaEmpleado -gt $lineasEmpleado -o $lineaEmpleado -lt 0 ]; then
                        clear
                        echo "Numero de linea incorrecto."
                fi
        done

        if [ $lineaEmpleado -ne 0 ]; then
                lineasEmpleado=$lineasEmpleado-$lineaEmpleado
                lineaEmpleado=$lineaEmpleado-1
                if [ $linea -eq 0 ]; then
                        echo "`tail -$lineasEmpleado "proyecto$nombreProyecto/empleados.txt"`" > "proyecto$nombreProyecto/aux.txt"
                elif [ $lineas -eq 0 ]; then
                        echo "`head -$lineaEmpleado "proyecto$nombreProyecto/empleados.txt"`" > "proyecto$nombreProyecto/aux.txt"
                else
                        echo -e "`head -$lineaEmpleado "proyecto$nombreProyecto/empleados.txt"`\n`tail -$lineasEmpleado "proyecto$nombreProyecto/empleados.txt"`" > "proyecto$nombreProyecto/aux.txt"
                fi
                mv "proyecto$nombreProyecto/aux.txt" "proyecto$nombreProyecto/empleados.txt"
        fi

fi

clear