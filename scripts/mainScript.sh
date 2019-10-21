#!/bin/bash

if [ "$1" = "--help" ]; then
    # Esto es lo que se va a ejecutar si se escribe como primer parametro --help
    echo "--help detectado, inicializando mensaje de ayuda..."
    echo -e "\nAl iniciar el programa le apareceran opciones que tienen un numero a la izquierda."
    echo "Para elegir las opciones debemos escribir dicho numero."
    echo -e "\nEl programa nos permitira lo siguiente: "
    echo -e "\t\t\tCrear, modificar y eliminar proyectos."
    echo -e "\t\t\tCrear, modificar y eliminar empleados."
    echo -e "\t\t\tAsignar empleados a los proyectos."
    echo -e "\t\t\tMostrar la lista de todos los empleados."
    echo -e "\t\t\tMostrar la lista de todos los proyetos."
else
    # Aqui empieza nuestro programa
    clear
    echo "Bienvenido."
    touch listaProyectos.txt
    touch listaEmpleados.txt
    option="0"
    while [ "$option" != "3" ]; do
        echo 1. Empleados
        echo 2. Proyectos
        echo 3. Salir
        read -p "Elegir opcion: " option # Pide la opcion
        case $option in # Aqui la evalua
            1)
                clear
                ./scriptEmpleados.sh
                ;;
            2)
                clear
                ./scriptProyectos.sh
                ;;
            3)
                echo "Fin del programa."
                ;;
            *)
                clear
                echo "Opcion incorrecta o invalida."
                ;;
        esac
    done
fi
# Esto ya no es parte del programa

