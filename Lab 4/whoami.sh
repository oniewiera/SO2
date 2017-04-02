#! /bin/bash
#<Aleksandra Niewiera>
#Napisz skrypt, który dla podanego miejsca w systemie plików (parametr wywołania skryptu)
#oraz wszystkich jego podkatalogow wypisze ścieżkę, nazwę użytkownika, grupy, uprawnienia do plików zwykłych, ktorych
#formalnym właścicielem nie jest aktualny użytkownik (whoami)
for path in $(find $1 ! -user $(whoami) -type f); do # whoami
ls -l $path
done
