#!/bin/bash
#############################################################
#Verifier si est en root
if [ `whoami` != 'root' ]
  then
    echo "Utilisateur root requis"
    echo "Utilisez la commande sudo"
    exit 1
fi
#############################################################
#Verifier si l'utilisateur existe déjà
read -p "Nom d'utilisateur: " usr
if id -u $usr >/dev/null 2>&1;
then
  echo "Utilisateur $usr existe déjà."
  exit 1
fi
#############################################################
#Verifier si le si répertoire existe déjà
if [ -d "/home/${usr}" ]
then
  echo "Le répertoire /home/${usr} existe déjà"
  exit 1
else
  mkdir /home/${usr}
fi
#############################################################
#Création de l'utilisateur
useradd -d /home/${usr} $usr
passwd $usr && echo "Utilisateur $usr crée avec succès"
