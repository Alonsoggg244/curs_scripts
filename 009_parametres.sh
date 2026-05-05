#!/bin/bash

#Ens mostra el scrpt executat
echo "El nom del script és ${0}"

#mostrarem el PATH (RUTA) i el filename (NOM DEL FITXER) del script
echo "el PATH: $(dirname ${0}) el fitxer seria $(basename ${0})"

#per determinar es número de parametres
NUMERO_DE_PARAMETRES=${#}

if [[ ${NUMERO_DE_PARAMETRES} -eq 0 ]]
then
    echo "USAGE:${0} USER_NAME [USER_NAME] ..."
    exit
fi

#${*} -->mostra conjunt de paràmetres en una sola paraula "${1} ${2} ${3}.....${n}"
echo "${*}"
echo
#${@} -->mostra conjunt de parametres en paraules diferents "${1}" "${2}" "${3}" ..... "${n}"
echo "${@}"

#estructura de cotrol FOR per iterar els parametres
for USER_NAME in "${@}"
do
    PASSWORD=$(date +%s%N | sha256sum | head -c10 )
    echo "${USER_NAME}:${PASSWORD}"
done

#recorrer els parametres amb un WHILE
echo "ITERACIÓ AMB WHILE"
while [[ ${X} -ge 1 ]]
do
    #${1} -->mostra la primera posició
    USER_NAME=${1}
    PASSWORD=$(date +%s%N | sha256sum | head -c10 )
    echo "${USER_NAME}:${PASSWORD}"
done