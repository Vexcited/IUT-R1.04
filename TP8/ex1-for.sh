#!/bin/bash

# A chaque itération, var est décrémenté de 1 
for (( var=10; var>0; var-- ))
do
  echo "J'ai enlevé un et var vaut" $var
done

