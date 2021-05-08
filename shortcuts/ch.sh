#!/bin/sh

#Directory manager for linux so that one can transerve through directories with ease

case $1 in
	-a)
		loc=$(pwd)
		echo $loc

		while IFS=, read -r code dr;
		do
			if
				test $loc == $dr
			then
				echo This directory is already present in my log
				return;
			fi

		done < ~/shellscripts/shortcuts/dir_list.csv

		lines=$(wc -l ~/shellscripts/shortcuts/dir_list.csv |cut -d' ' -f1)
		lines=$((lines+1))
		echo Code for this dir is $lines
		echo $lines,$(pwd) >> ~/shellscripts/shortcuts/dir_list.csv

		return;
	;;

	*)
		if 
			test -f ~/shellscripts/shortcuts/dir_list.csv; 
		then
			:
		else
			echo No previous directory logs exists'!!!'
			return;
		fi

		if	
			test -z $1
		then

			while IFS=, read -r code dr;
			do		
				echo -e $code '\t' $dr
			done < ~/shellscripts/shortcuts/dir_list.csv
			
			echo -n Enter a valid option : 
			read option
			
		else
			
			option=$1;
			
		fi

		while IFS=, read -r code dr;
		do
			if
				test $option -eq $code
			then
				cd $dr
				return;
			fi
		
		done < ~/shellscripts/shortcuts/dir_list.csv
		
		echo Directory not changed.
		echo Please enter a valid option here.
		
	;;
esac
