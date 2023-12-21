#!/bin/bash

# On vérifie qu'il n'y a pas d'argument.
# Si il y en a, on affiche un message d'erreur et on quitte le script.
if [ $# -ne 0 ]
then
    echo "Utilisation: $0"
    exit 1
fi

# On vérifie qu'il y a des fichiers .txt dans le dossier courant.
# Si il n'y en a pas, on affiche un message d'erreur et on quitte le script.
if [ ! -e *.txt ]
then
    echo "Il n'y a pas de fichiers .txt dans le dossier courant."
    exit 2
fi

# Récupérer tout les fichiers d'extension .txt dans le répertoire d'exécution
# et ajouter un .old à la fin de leur extenstion (ex: fichier.txt.old)
for file in *.txt
do
    mv $file $file.old
done
