#!/bin/bash
# -------------------------------------------------------------- #
# Script      :
# Description :
# Version     : 0.1
# Author      : Stefano Emmanuel <stefanoecs@gmail.com>
# Date        : Jul 27, 2021
# License     : GNU/GPL v3.0
# -------------------------------------------------------------- #
# How to use:
# -------------------------------------------------------------- 
declare -a times
while IFS= read -r line
do
  jogo=($(echo $line | tr "," " "))
  times+="${jogo[5]} "

done < $1

# Retira os times Duplicados do Array times
temp=$(echo ${times[@]} | tr ' ' '\n' | sort -u | tr '\n' ',')

# Retira a , do final da linha
echo ${temp%","} > "times$1"
