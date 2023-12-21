#!/bin/bash

# On vérifie qu'on ne reçoit pas d'argument.
if [ $# -ne 0 ]
then
  echo "Erreur de syntaxe : trop d'arguments"
  exit 1
fi

# On récupére les utilisateurs connectés sur la machine.
details=$(who | cut -d " " -f1,2)

# On itère sur chaque ligne de details
echo "$details" | while read line
do
  username=$(echo "$line" | cut -d " " -f1)
  screen=/dev/$(echo "$line" | cut -d " " -f2)
  rights=$(ls -l $screen | cut -d " " -f1)

  # On affiche le résultat
  echo "$username est connecté sur $screen avec les droits $rights"
done
  