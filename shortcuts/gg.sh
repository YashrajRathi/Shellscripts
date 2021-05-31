#!/bin/sh
##A script to open a gedit fast with a shortcut
## https://linuxhandbook.com/run-alias-as-sudo/#:~:text=In%20other%20words%2C%20in%20a,sudo%20is%20checked%20for%20alias.

##Just go through the above article

if
test -z $1
then
	echo No file is given;
else
	fl=$(pwd)/$1
	gedit $fl &
fi
