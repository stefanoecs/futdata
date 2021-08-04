#!/bin/bash
ind_g=0
while IFS= read -r line
do
  
  jogo=($(echo $line))
  ## Se tiver a palavra Rodada pega o numero da rodada
  if [ "${jogo[0]}" = "Rodada" ]
  then
  	rodada=${jogo[1]}
  	continue
  
  #Se tiver : na linha pega a data 
  elif [[ $line =~ ":" ]]
  then
  	data=${jogo[0]%"."}
  	ind_g=1
  	continue
  	
  # Pega o time de Casa
  elif [[ $ind_g -eq 1 ]]
  then
  	casa=$line
  	ind_g=2
  	continue
  
  #Pega o time de Fora
  elif [[ $ind_g -eq 2 ]]
  then
  	fora=$line
  	ind_g=3
  	continue
  	  	
  #Linha com o caractere unico -
  elif [[ $line =~ "-" ]] && [[ ${#line} -eq 3 ]]
  then
  	continue
  		  
  #Pegar gol casa
  elif [[ ${#line} -eq 1 ]] && [[ $ind_g -eq 3 ]]
  then
  	golcasa=$line
  	ind_g=4
  	continue
  	
  #Pegar gol fora
  elif [[ ${#line} -eq 1 ]] && [[ $ind_g -eq 4 ]]
  then
  	golfora=$line
  	ind_g=5
  	continue
  
  #Pega linha com o placar do 1 tempo
  elif [[ $line =~ "-" ]] && [[ $ind_g -eq 5 ]] && [[ $line =~ "(" ]]
  #elif [[ $line =~ "-" ]] && [[ ${#line} -ne 3 ]] && [[ $line =~ "(" ]]
  then
  	temp=${line%")"}
  	placar_h=($(echo ${temp#"("}))
  	ind_g=6
  	echo "$rodada,$data,$casa,$fora,${placar_h[0]},${placar_h[2]},$golcasa,$golfora"
  	
   
  fi

done < $1


