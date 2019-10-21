#!/bin/bash

# Script utilizado para anadir empleado.

nomApe=""
ci=""
cargo=""
tel=""

clear
read -p "Ingrese el nombre completo del empleado: " nomApe

clear
read -p "Ingrese la cedula de identidad del empleado: " ci

clear
read -p "Ingrese el cargo del empleado: " cargo

clear
read -p "Ingrese el telefono empleado: " tel

clear
echo $nomApe ":" $ci ":" $cargo ":" $tel >> listaEmpleados.txt