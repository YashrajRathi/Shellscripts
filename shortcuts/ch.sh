#!/bin/sh

#Directory manager for linux so that one can transerve through directories with ease
#Normally very boring to remember your previously logged directory so this is much better

re_eval()
{

	line_no=1;
	while IFS=, read -r code dr;
	do
		echo $line_no,$dr >> ~/shellscripts/shortcuts/dir_list_temp.csv
		line_no=$((line_no+1))

	done < ~/shellscripts/shortcuts/dir_list.csv

	cat ~/shellscripts/shortcuts/dir_list_temp.csv > ~/shellscripts/shortcuts/dir_list.csv
	rm ~/shellscripts/shortcuts/dir_list_temp.csv
}

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

		lines=$(wc -l ~/shellscripts/shortcuts/dir_list.csv | sed 's/^ *//' | cut -d' ' -f1)
		lines=$((lines+1))
		echo Code for this dir is $lines
		echo $lines,$(pwd) >> ~/shellscripts/shortcuts/dir_list.csv

		return;
	;;

	-d)
		while IFS=, read -r code dr;
		do		
			echo -e $code '\t' $dr
		done < ~/shellscripts/shortcuts/dir_list.csv

		read code_of_directory_to_be_deleted;

		while IFS=, read -r code dr;
		do
			if
				test $code_of_directory_to_be_deleted -eq $code
			then
				sed -i -e $code_of_directory_to_be_deleted'd' ~/shellscripts/shortcuts/dir_list.csv
			fi
		
		done < ~/shellscripts/shortcuts/dir_list.csv
		re_eval
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
				cd "$dr"
				return;
			fi
		
		done < ~/shellscripts/shortcuts/dir_list.csv
		
		echo Directory not changed.
		echo Please enter a valid option here.
		
	;;
esac
