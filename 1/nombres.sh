#! /bin/bash
nombre1=$1
nombre2=$2
if [ $nombre1 -eq $nombre2 ]
then
    echo "Les deux nombre sont egaux"
    echo "$nombre1 = $nombre2"
elif [ $nombre1 -gt $nombre2 ]
then
    echo "Le premier nombre est superieur au deuxieme nombre"
    echo "$nombre1 > $nombre2"
else
    echo "Le premier nombre est inferieur au dexuieme nombre"
    echo "$nombre1 < $nombre2"
fi