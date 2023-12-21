#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Utilisation: $0 <nom_commande>"
    exit 1
fi

# On cherche le chemin de la commande avec le $PATH,
# puis on affiche le premier chemin trouvé.
for dir in $(echo $PATH | tr ':' ' ')
do
    if [ -x $dir/$1 ]
    then
        echo "$dir/$1"
        exit 0
    fi
done

# Si aucun chemin n'est trouvé, on affiche un message d'erreur
echo "$1: commande n'existe pas"

