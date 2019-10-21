#!/bin/bash

# Script usado para asignar empleados a proyecto.

option="0"
    while [ "$option" != "1" -a "$option" != "4" ]; do
        echo 1. Desasignar
        echo 2. Mostrar Proyectos
        echo 3. Mostrar Empleados de un Proyecto
        echo 4. Cancelar
        read -p "Elegir opcion: " option # Pide la opcion
        case $option in # Aqui la evalua
            1)
                clear
                ./scriptDesAsignarEmpleado.sh
                ;;
            2)
                clear
                ./scriptMostrarProyectos.sh
                ;;
            3)
                clear
                ./scriptMostrarEmpleadosDeProyecto.sh
                ;;
            4)
                clear
                ;;
            *)
                clear
                echo "Opcion incorrecta o invalida."
                ;;
        esac
    done