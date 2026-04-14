#!/bin/bash

#aquest script ens mostra com
#realitzar les principals operacions aritmètiques

read -p "Introdueix el valor de X: " X
read -p "Introdueix el valor de Y: " Y

echo "Has intruït ${X} i ${Y}"

SUMA=$((X+Y))
echo "${X}+${Y}=${SUMA}"

RESTA=$((X-Y))
echo "${X}-${Y}=${RESTA}"

PRODUCTE=$((X*Y))
echo "${X}*${Y}=${PRODUCTE}"

DIVISIO=$(echo "scale=2; ${X}/${Y}" | bc)
echo "${X}/${Y}=${DIVISIO}"
