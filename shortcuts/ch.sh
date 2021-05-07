#!/bin/sh

case $1 in
	-a)
		loc=$(pwd)
		echo $loc
		res=$(grep -f ~/shellscripts/shortcuts/dir_list.csv $loc)
	;;
	*)
	if	
		test -z $1
	then

		echo false path 
		while IFS=, read -r code dr;
		do
		
			echo -e $code '\t' $dr
		
		done < ~/shellscripts/shortcuts/dir_list.csv
		
		read option

	else

		option=$1;
		echo true path 

	fi

	while IFS=, read -r code dr;
	do
		echo Checking for $code
		if
			test $option -eq $code
		then
			cd $dr
			return;
		fi

	done < ~/shellscripts/shortcuts/dir_list.csv
	;;
esac
