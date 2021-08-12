#!/bin/bash

for i in {1..38}
do
 	awk -v num=$i '
		BEGIN {
			FS="|";
			linha=""
		}
 		{
 			if( ($1 == 2020) && ($2 == num) )
 				linha =linha $0 "\n"
 		}
 		 		
 		END {
 			print linha
 		}' $1
 
done
 