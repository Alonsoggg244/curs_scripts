#!/bin/bash
function usage(){
    echo "Usage ${0} USER_NAME [COMMENTS]"
    echo
    echo "has de ser root"
    echo "COMMENTS conté el nom complet de l'usuari"
    exit 1 #indica que hi ha hagut una errada
}

#Script per crear un usuari 

#primer comprovam si som l'usuari root
if [[ ${UID} -ne 0 ]]
then
    usage
fi

#Comprovam que hi ha almenys un paràmetre
if [[ ${#} -eq 0 ]]
then
    usage
fi

USER_NAME=${1}
#Desplaçam els paràmetres a l'esquerra
shift
COMMENTS="${*}"

#generarem aleatoriament el password
PASSWORD=$(date +%s%N | sha256sum | base64 | head -c8 )

useradd -m -c "${COMMENTS}" ${USER_NAME} &> /dev/null
#control de la darrera comanda
if [[ ${?} -ne 0 ]]
then
    echo "Errada creant l'usuari"
    exit 1
fi

#canvi de password
echo "${USER_NAME}:${PASSWORD}" | chpasswd
#comprovam si el canvi de password ha anat bé.
if [[ ${?} -ne 0 ]]
then
    echo "Errada canviant password"
    exit 1
fi

#fer caducar el password
passwd -e ${USER_NAME}

#Informam del que s'ha creat l'usuari i el password
echo "nom complet: ${COMMENTS}"
echo "Usuari creat: ${USER_NAME}"
echo "Password generat: ${PASSWORD}"
echo "Hostname: ${HOSTNAME}"

exit 0