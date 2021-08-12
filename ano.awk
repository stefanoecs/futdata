#!/usr/bin/awk -f
# Include Year in DB csv
BEGIN {
		FS="(\|)|(\/)";
	}
 	{
 		print $4"|"$0
 	}
 
 	
 	