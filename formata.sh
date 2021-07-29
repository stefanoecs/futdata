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
# -------------------------------------------------------------- #

while IFS= read -r line
do
  semespaco=$(echo $line | tr " " "_")
  jogo=($(echo $semespaco | tr "," " "))
  for i in {2012..2020}
  do
    [[ ${jogo[2]} -eq $i ]] && temp=$(echo ${jogo[@]} | tr " " ",") && echo $temp >> "$i.csv"
  done
done < $1
