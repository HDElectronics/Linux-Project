#!/bin/bash

#Récupérer la liste des taches du fichier "mem"
#Changer le delimiteur de "Espace" à "Nouvelle lingne"
SAVEIFS=$IFS
#IFS=$'\n'
#Lire et mettre dans une liste le fichier "mem" qui contient les taches
readarray my_array <mem;
#Executer ajoute ou liste ou fini selon ce que l'utilisateur a écrit en argument "$1"
case "$1" in
    ajoute) #dans le cas où l'utilisateur veut ajouter une tache
        IFS=$'\n'
        postoadd=$2
        postoadd=$((--postoadd))
        valtoadd=$3
        ################################################################################################################################################       
        #Verifier si l'utilisateur a bien entré les arguments (position, tache)
        if [[ $2 -eq 0 ]] || [ -z $3 ]
        then
            echo -e "il manque des argument! écriez sous cette forme: ajoute <position> <\"tache à ajouter\">"
            exit 0
        fi
        ################################################################################################################################################
        #verifier si la position n'est pas hors de portée
        if [[ $2 -gt $((${#my_array[@]}+1)) ]] 
        then
            echo "La position que vous avez choisi est hors de porté la position max que vous pouvez choisir est: $((${#my_array[@]}+1)) "
            exit 0
        fi
        ################################################################################################################################################
        #ajouter la tache à la position demander par l'utilisateur
        for (( x=0; x<=${#my_array[@]}; x++ ))
        do
            if [[ ${x} -eq ${postoadd} ]]
            then
                temp+=(${valtoadd})
                echo "La tache $valtoadd a été ajouté à la position $((postoadd+1))"
            fi
            temp+=(${my_array[x]})
        done
        my_array=(${temp[@]})
    ;;
    liste) #dans le cas où l'utilisateur veut voir la liste des taches
        for x in ${!my_array[@]}
        do
            echo "$((x+1)) - ${my_array[x]}"
        done
    ;;
    fini) #dans le cas ou l'utilisateur veut enelever une tache de la liste
        postodel=$2
        postodel=$((--postodel))
        echo "La tache ${my_array[$postodel]} a été finit"
        unset my_array[$postodel]
    ;;
    --help) #dans le cas ou l'utilisateur veut voir le "help" de ce script
        echo "welcome to the help"
    ;;
    *) #dans le cas où l'utilisateur n'a entré aucun argument 
        echo "Entrez un argument (liste, ajoute, fini)"
        exit 1
    ;;
esac
#effacer le contenu de "mem" pour réecrire un nouveau contenu
truncate -s 0 mem
#rm mem
#mettre à jour la liste des taches
printf "%s\n" "${my_array[@]}" > mem