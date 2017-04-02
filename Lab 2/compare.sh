#!/bin/bash
# <Aleksandra> <Niewiera>

if [ "$#" -eq 2 ]
	then
	echo Podano poprawną liczbe argumentów
else
	echo Podano niepoprawną liczbę argumentów
	exit 1
fi
if ( test -r "$1" && test -d "$2" && test -d "$1" && test -r "$2" ); then #spr czy katalog roboczy
	for file1 in `ls "${1}" -p -B` #-p dodaje / po nazwie jesli kat
	do
		for file2 in `ls "${2}" -p -B`
		do
			line=`ls -l "$1/$file1"` #spr uprawnienia1

			line2=`ls -l "$1/$file2"` #spr uprawnienia2


					if [ "${file1: -1}" != "/" ] && [ "${file2: -1}" != "/" ]; #jesli nie katalog
					then
						if [ "${line:9:1}" == "x" ] && [ "${line2:9:1}" == "x" ] # wykon
						then
						if [ "$file1" == "$file2" ]
						then
						echo $file1 #jesli identyczne pliki
						fi
						fi
					elif [ "${file1: -1}" == "/" ] && [ "${file2: -1}" == "/" ]; then
						$0 $1/$file1 $2/$file2

					fi
		done
	done
fi
