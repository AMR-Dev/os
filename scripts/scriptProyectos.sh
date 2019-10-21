#!/bin/bash

# Este es el scipt del menu de proyectos
option=0
while [ "$option" != "7" ];do
    echo "1. Mostrar todos los proyectos."
    echo "2. Mostrar proyecto"
    echo "3. Añadir proyecto"
    echo "4. Asignar empleado a proyecto"
    echo "5. Eliminar proyecto"
    echo "6. Modificar proyecto"
    echo "7. Salir"
    read -p "Elegir opcion: " option # Pide la opcion
    case $option in # Aqui la evalua
        1)
            clear
            ./scriptMostrarProyectos.sh
            ;;
        2)
            ./scriptMostrarProyecto.sh
            ;;
        3)
            clear
            ./scriptAnadirProyecto.sh
            ;;
        4)
            clear
            ./scriptAsignarEmpleadoMenu.sh
            ;;
        5)
            clear
            ./scriptEliminarProyecto.sh
            ;;
        6)
            clear
            ./scriptModificarProyecto.sh
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
