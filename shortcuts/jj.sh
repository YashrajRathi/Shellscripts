#!/bin/sh

##This is a simple script to compile and 
##run any java file from any directory in linux terminal
##Sort of helps us not do the redundunt work

if
test -z $1
then
	echo No file is given;
else
	echo $1.java file is given.
	fl=$(pwd)/$1;
	if
		!((test -f $fl.java))
	then
		echo File not found!!!
		return 99;
	fi
	javac $fl.java;
	if
	test 0 -eq $?
	then
		echo File compiled without error;
		java $1;
	else
		echo Error detected;
	fi
fi
