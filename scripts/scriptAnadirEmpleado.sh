#!/bin/bash

# Script utilizado para anadir empleado.

nomApe=""
ci=""
cargo=""
tel=""

clear
read -p "Ingrese el nombre completo del empleado: " nomApe

clear
buscEmpl="."
while [ "$buscEmpl" != "" -o "$ci" == "" ]; do
    read -p "Ingrese la cedula de identidad del empleado: " ci
    buscEmpl=`grep "$ci" listaEmpleados.txt`
    if [ "$buscEmpl" != "" -o "$ci" == "" ];then
        clear
        echo "La cedula coincide con la cedula de otro empleado."
    fi
done

clear
read -p "Ingrese el cargo del empleado: " cargo

clear
read -p "Ingrese el telefono empleado: " tel

clear
echo $nomApe ":" $ci ":" $cargo ":" $tel >> listaEmpleados.txt