#!/bin/bash

# Demander de saisir un nombre
echo "Saisir un nombre"
read nb

# Initialiser une variable `somme` contenant 0
somme=0

# Calculer la somme des n premiers entiers de manière itérative
for (( i=1; i<=$nb; i++ ))
do
  somme=$(($somme + $i))
done

# Afficher la somme
echo "La somme des $nb premiers entiers vaut $somme"
