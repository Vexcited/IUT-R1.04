#!/bin/bash

# Aucun paramètre est demandé
if [ $# -ne 0 ]
then
  echo "Aucun paramètre doit être passé."
  exit 1
fi

echo "Entrez la longueur du rectangle : "
read longueur

echo "Entrez la largeur du rectangle : "
read largeur

# La largeur n'est pas plus grande que la longueur
if [ $largeur -gt $longueur ]
then
  echo "La largeur ne peut pas être plus grande que la longueur."
  exit 1
fi

# On calcule l'aire
aire=$(($longueur * $largeur))
echo "L'aire du rectangle est de $aire"

