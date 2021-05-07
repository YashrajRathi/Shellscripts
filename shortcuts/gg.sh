#!/bin/sh
##A script to open a gedit fast with a shortcut	

if
test -z $1
then
	echo No file is given;
else
	fl=$(pwd)/$1
	gedit $fl &
fi
