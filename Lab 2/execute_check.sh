#! /bin/bash


for file in `ls "${1}"`
do
line=`ls -l "$1/$file"` #spr uprawnienia
echo $line;
if [ "${line:9:1}" != "x" ]; #od 9 1 znak
#-rw-rw-r-x -> x wykonywalny
then
echo nie wykonywalny
rm $1/$file
fi
done
