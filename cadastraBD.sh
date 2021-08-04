#!/bin/bash
ind_g=0
while IFS= read -r line
do
  
  jogo=($(echo $line))
  awk -F "," '{print "INSERT INTO jogos VALUES(NULL," $1 ",'\''" $2 "/2014'\'','\''" $3 "'\'','\''" $4 "'\''," $5 "," $6 "," $7 "," $8 ",0.0,0.0,0.0);"}' Br_2014.csv > cadas2014.sql


UPDATE clientes SET bloqueado=1 WHERE UF='RJ'


done < $1


