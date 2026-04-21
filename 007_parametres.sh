#!/bin/bash
function usage(){
    echo "Usage ${0} USER_NAME [COMMENTS]"
    echo "COMMENTS conté el nom complet"
    exit 1
}
NUMBER_PARAMETERS=${#}
if [[ ${NUMBER_PARAMETERS} -eq 0 ]]
then
    usage
fi
echo "Nombre de parametres: ${NUMBER_PARAMETERS}"


#aprendrem a tractar amb els arguments (com s'anomenen a fora) i parametres (com s'anomenen a dins)
SCRIPT_NAME=${0}
echo "Nom del script ${SCRIPT_NAME}"
#${1}.....${9}
echo "1er parametre: ${1}"
USER_NAME=${1}
echo "USER_NAME: ${USER_NAME}"
#desplaçar els parametres a l'esquerra
shift

NOM_COMPLET="${*}"
echo "NOM_COMPLET: ${NOM_COMPLET}"