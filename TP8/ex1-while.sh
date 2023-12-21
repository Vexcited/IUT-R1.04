#!/bin/bash

# Initialiser une variable `var` contenant 10
var=10

# Tant que `var` est strictement positif Faire
while [ $var -gt 0 ]
  # Décrémenter var de 1
  do var=$(($var - 1))
  # Afficher ...
  echo "J'ai enlevé un et var vaut" $var
# Fin Tant que
done