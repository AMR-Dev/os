#!/bin/bash

# Este es el scipt del menu de empleados
option="0"
while [ "$option" != "7" ];do
    echo "1. Mostrar todos los empleados."
    echo "2. Añadir empleado"
    echo "3. Asignar empleado a proyecto"
    echo "4. Desasignar empleado a proyecto"
    echo "5. Eliminar empleado"
    echo "6. Modificar empleado"
    echo "7. Salir"
    read -p "Elegir opcion: " option # Pide la opcion
    case $option in # Aqui la evalua
        1)
            clear
            ./scriptMostrarEmpleados.sh
            ;;
        2)
            clear
            ./scriptAnadirEmpleado.sh
            ;;
        3)
            clear
            ./scriptAsignarEmpleadoMenu.sh
            ;;
        4)
            clear
            ./scriptDesAsignarEmpleadoMenu.sh
            ;;
        5)
            clear
            ./scriptEliminarEmpleado.sh
            ;;
        6)
            clear
            ./scriptModificarEmpleado.sh
            ;;
        7)
            clear
            ;;
        *)
            clear
            echo "Opcion incorrecta o invalida"
            ;;
    esac
done
