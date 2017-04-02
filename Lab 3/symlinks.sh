#! /bin/bash
#Napisz skrypt, który wyświetli nazwy symlinkow z katalogu($1),
#ktore wskazuja na okreslone miejsce w systemie plikow ($2)
#25
if [ "$#" -eq 2 ]
	then
	echo Podano poprawną liczbe argumentów
else
	echo Podano niepoprawną liczbę argumentów
	exit 1
fi

for file in `ls "${1}"`
do
		if ( test -L "$1/$file" ) ; then #sprawdz czy symlink
			path1=`realpath "$1/$file"` #realpath do $1
			path2=`realpath "$2"` #realpath do $2
			if [ $path1 = $path2 ]; then
			echo $file
			fi
		fi
done
