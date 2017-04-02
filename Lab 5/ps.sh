#<Aleksandra Niewiera>
#Skrypt monitorujący system, który wykorzystuje wynik działania komendy ps aux. Narzędzie wyświetla
#listę 10 procesów, które najbardziej obciążają procesor i pamięć (w kolejności %CPU %MEM)
# Skrypy zgłasza posortowaną listę procesów, które są aktywnie wykonywane od dłuższego (niż minuta) czasu - kolumna TIME.
#Wyświetlana jest również ilość wszystkich procesów w systemie oraz policzone ile z nich należy do poszczególnych użytkowników
ps aux | tail -n +2 | sort -nr -k 3,4 |head| while read file
do
echo $file
done
suma=`ps aux | tail -n +2 | wc -l`
echo Wszystkich procesów $suma
ola=`ps aux | tail -n +2 | grep aleksa*| wc -l`
root=`ps aux | tail -n +2 |grep root | wc -l`
whoopsie=`ps aux | tail -n +2 |grep whoopsie | wc -l`
syslog=`ps aux | tail -n +2 | grep syslog | wc -l`
rtkit=`ps aux | tail -n +2 |grep rtkit| wc -l`
lp=`ps aux | tail -n +2 |grep lp| wc -l`

echo Aleksandra: $ola  Root: $root Whoopsie: $Whoopsie Syslog: $syslog Rtkit: $rtkit Lp: $lp
ps aux | tail -n +2 | sort -nr -k 10| while read line
do
  time=`echo $line | tr -s ' ' | cut -d ' ' -f 10 |cut -d ':' -f 1`
if [[ $time > 1 ]]; then
  echo $line
fi

done
