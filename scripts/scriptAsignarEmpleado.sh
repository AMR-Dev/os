#!/bin/bash

# Script para asignar un empleado a un proyecto

declare -i lineas=`cat listaEmpleados.txt | wc -l`
declare -i lineaProyecto=-1
declare -i lineaEmpleado=-1

while [ $lineaEmpleado -gt $lineas -o $lineaEmpleado -lt 0 ]; do
        read -p "Escriba el numero de linea del empleado a asignar (0 para cancelar): " lineaEmpleado
        if [ $lineaEmpleado -gt $lineas -o $lineaEmpleado -lt 0 ]; then
                clear
                echo "Numero de linea incorrecto."
        fi
done

if [ $lineaEmpleado -ne 0 ]; then
        clear
        lineas=`cat listaProyectos.txt | wc -l`
        while [ $lineaProyecto -gt $lineas -o $lineaProyecto -lt 0 ]; do
                read -p "Escriba el numero de linea del proyecto (0 para cancelar): " lineaProyecto
                if [ $lineaProyecto -gt $lineas -o $lineaProyecto -lt 0 ]; then
                        clear
                        echo "Numero de linea incorrecto."
                fi
        done

        if [ $lineaProyecto -ne 0 ]; then
                clear
                nombreProy=`head -$lineaProyecto listaProyectos.txt | tail -1`
                empleado=`head -$lineaEmpleado listaEmpleados.txt | tail -1`
                echo "El empleado seleccionado es: "
                echo $empleado
                echo "El proyecto seleccionado es: "
                echo $nombreProy
                option=""
                read -p "Seguro que desea asignarlo? (si/no): " option
                touch "proyecto$nombreProy/empleados.txt"
                if [ $option == "si" -o $option == "Si" ]; then
                        buscEmpl=`grep "$empleado" "proyecto$nombreProy/empleados.txt"`
                        if [ "$buscEmpl" == "" ]; then
                                infoProy="proyecto$nombreProy/info.txt"
                                empleadoProy="proyecto$nombreProy/empleados.txt"
                                echo "$empleado" >> "$empleadoProy"
                                # echo -e "`head -3 $infoProy`\n`cat $empleadoProy | wc -l`\n`tail -1 $infoProy`" > "proyecto$nombreProy/aux.txt"
                                # mv "proyecto$nombreProy/aux.txt" "$infoProy"
                        fi
                fi
        fi
fi

clear