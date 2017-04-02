#! /bin/bash
#dowiazania symboliczne z jednego katalogu do drugiego (jesli nie istnieje ($1 i $2)) +
#31
#<Aleksandra><Niewiera>
if [ "$#" -eq 2 ]
	then
	echo Podano poprawną liczbe argumentów
else
	echo Podano niepoprawną liczbę argumentów
	exit 1
fi
if [ -d "$1" ] && [ -d "$1" ]
	then
	echo To katalogi
else
	echo Przynajmniej jeden z argumentow nie jest katalogiem, sprobuj ponownie
	exit 1
fi

for file in `ls "${1}"`
do
	path1=`realpath "$1/$file"`
	if [ -d $file ];#jesli podkatalog
	then
	mkdir $2/$file
	$0 $1/$file $2/$file
	else

	check=0
	for link in `ls "${2}"`
	do

   		 path2=`realpath "$2/$link"`
		if [ $path1 = $path2  ]; then
		  echo "Istnieje dowiazanie do pliku $file"
       			if ( test -L "$1/$file" )  ;then #jesli symlink
			check=1
			fi


 			if [[ "$2/$link" != $path1 ]]; then #jesli sciezka kanoniczna
			rm $2/$link
			check=0
			fi

			if ( test "$1/$file" -ef "$2/$link" ); then #jesli dowiazanie twarde
			check=1
			fi

		fi
	done
  	if [ $check == 0 ];
  	then
    		ln -s $path1 $2/"link-"$file
  	fi
	fi
done
