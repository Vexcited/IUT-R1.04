#!/bin/bash

# On vérifie qu'on ne reçoit qu'un seul argument.
if [ $# -ne 1 ]
then
  echo "Erreur de syntaxe : 1 seul argument attendu"
  exit 1
fi

# On vérifie si le fichier existe.
if [ ! -f "$1" ]; then
	echo "$1 n'est pas un fichier valide."
	exit 2
fi

# Fichier que l'on va créer/écraser.
output=ex6-output.txt

# On vérifie si le fichier de sortie existe.
if [ -f "$output" ]; then
  # On demande à l'utilisateur si il veut écraser le fichier.
  read -p "Le fichier $output existe déjà, voulez-vous l'écraser ? (y/n) " answer
  # Si il ne veut pas, on quitte le script.
  if [ "$answer" != "y" ]; then
    exit 0
  # Sinon, on supprime le fichier.
  else
    rm $output
  fi
fi


# La première itération est les noms des colonnes, on l'ignore.
line_index=0

# On lit le fichier CSV passé en argument.
while read -r line
do
  # On vérifie si on est sur la première ligne.
  if [ $line_index -eq 0 ]
  then
    # On récupère les noms des colonnes
    # que l'on a dans le fichier CSV.
    cols=$(echo "$line" | tr "," " ")
    # On incrémente i pour ignorer la première ligne.
    ((line_index++))
    continue
  fi

  # On récupère les valeurs de la ligne courante.
  values=$(echo "$line" | tr "," " ")
  column_index=1

  separator=";"

  for value in $values
  do
    # On vérifie si on est sur la dernière colonne.
    if [ $column_index -eq $(echo "$cols" | wc -w) ]
    then
      separator=".\n"
    fi

    # On récupère le nom de la colonne courante.
    col=$(echo "$cols" | cut -d " " -f$column_index)
    # On affiche le nom de la colonne et sa valeur.
    echo -e "$col: $value$separator" >> $output
    # On incrémente pour passer à la colonne suivante.
    ((column_index++))
  done
done < "$1"