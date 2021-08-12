#!/usr/bin/awk -f
# Include Year in DB csv

BEGIN {
		FS="(\[)|(\])";
		cont = 0
		num = 22
						
	}
 	{
 		if($2 == num)
 			cont++
 
 	}
 END {
 	print num" Rodadas sem fazer Gol ->"cont"x"
 }