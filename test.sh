#!/bin/bash
##Always begin with the hash bang slash bin slash bash
##use "cat /etc/shells" to see which shell your OS supports
SAVEIFS=$IFS
IFS=$'\n'
readarray -t my_array <myfile
echo ${my_array[@]}
