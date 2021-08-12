#!/usr/bin/awk -f
# Include Year in DB csv

BEGIN {
		FS="|";
		cont = 0;
		rodada=""
		
		time="Vasco"
				
	}
 	{
 		
 		if ($4 == time || $5 == time) {
 			#print $0
 			if($4 == time && $8 == 0){
 				cont++
 	 			rodada = rodada $2 "|"
 			}
 			if($5 == time && $9 == 0){
 				cont++
 				rodada = rodada $2 "|"
 			}
 		}
 	}
 END {
 	print time"|"rodada" ["cont"]"
 }
 
 	
 