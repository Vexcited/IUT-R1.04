# Check le nombre d'arguments
if [ $# -ne 1 ]
then
  echo "Usage: $0 <username>"
  exit 1
fi

usr=$1

# On utilise grep pour récupérer l'utilisateur dans /etc/passwd
grep "^$usr:" /etc/passwd > /dev/null
# On récupére le code de retour pour ensuite le vérifier
# 0 = existe, 1 = n'existe pas
exists=$?

# On vérifie si l'utilisateur existe
if [ $exists -eq 0 ]
then
  echo "L'utilisateur $usr existe !"
else
  echo "L'utilisateur $usr n'existe pas."
fi
