#!/bin/bash

# Script para editar empleado dado el numero seleccionado por el usuario

declare -i lineas=`cat listaProyectos.txt | wc -l`
declare -i linea=-1

while [ $linea -gt $lineas -o $linea -lt 0 ]; do
        read -p "Escriba el numero de linea del proyecto a modificar (0 para cancelar): " linea
        if [ $linea -gt $lineas -o $linea -lt 0 ]; then
                clear
                echo "Numero de linea incorrecto."
        fi
done

if [ $linea -eq 0 ]; then
        clear
else

        nombre=`head -$linea listaProyectos.txt | tail -1`
        clear
        buscProy="."
        nombreNuevo=""
        echo "El nombre del proyecto seleccionado es: "
        head -1 "proyecto$nombre/info.txt" | tail -1
        while [ "$buscProy" != "" -a "$nombreNuevo" != "MantenerNombre" ]; do
                echo "Si desea mantener el mismo nombre entonces escriba la palabra MantenerNombre"
                read -p "Ingrese nuevo nombre del proyecto (no puede ser igual al nombre de otros proyectos): " nombreNuevo
                        buscProy=`grep "$nombreNuevo" listaProyectos.txt`
                if [ "$buscProy" != "" -a "$nombreNuevo" != "MantenerNombre" ];then
                        clear
                        echo "El nombre del proyecto coincide con el nombre de otro proyecto."
                fi
        done

        if [ $nombreNuevo == "MantenerNombre" ]; then
                nombreNuevo=$nombre
        fi

        clear
        echo "La fecha inical del proyecto seleccionado es: "
        head -2 "proyecto$nombre/info.txt" | tail -1
        read -p "Pero no se puede cambiar. Aprete enter para continuar."
        fechaInicial=`head -2 "proyecto$nombre/info.txt" | tail -1`


        clear
        fechaFinal=""
        echo "La fecha final del proyecto seleccionado es: "
        head -3 "proyecto$nombre/info.txt" | tail -1
        echo "Si desea mantener la fecha final escriba la palabra MantenerFecha"
        read -p "Ingrese la fecha final: " fechaFinal

        if [ $fechaFinal == "MantenerFecha" ]; then
                fechaFinal=`head -3 "proyecto$nombre/info.txt" | tail -1`
        fi

        clear
        estado=""
        echo "El estado del proyecto seleccionado es: "
        head -5 "proyecto$nombre/info.txt" | tail -1
        echo "Si desea mantener el estado escriba la palabra MantenerEstado"
        read -p "Ingrese el estado del proyecto: " estado

        if [ $estado == "MantenerEstado" ]; then
                estado=`head -5 "proyecto$nombre/info.txt" | tail -1`
        fi
        
        clear
        echo "El proyecto actual es:`head -1 "proyecto$nombre/info.txt" | tail -1`:`head -2 "proyecto$nombre/info.txt" | tail -1`:`head -3 "proyecto$nombre/info.txt" | tail -1`:`head -5 "proyecto$nombre/info.txt" | tail -1`" 
        nuevoProyecto=`echo $nombreNuevo ":" $fechaInicial ":" $fechaFinal ":" $estado`
        echo "El proyecto modificado es:" $nuevoProyecto
        option=""
        read -p "Seguro que desea modificarlo? (si/no): " option
        if [ $option == "si" -o $option == "Si" ]; then
                lineas=$lineas-$linea
                linea=$linea-1
                echo -e "`head -$linea listaProyectos.txt`$nombreNuevo\n`tail -$lineas listaProyectos.txt`" > aux.txt
                mv aux.txt listaProyectos.txt
                echo -e "$nombreNuevo\n$fechaInicial\n$fechaFinal\n0\n$estado" > "proyecto$nombre/info.txt"
                mv "proyecto$nombre" "proyecto$nombreNuevo"
        fi
        clear

fi
