#! /bin/bash

if [ ! -d "linux" ]; then
wget http://datko.pl/linux.tar.xz
tar -xf linux.tar.xz
fi

pliki=`find linux -type f | wc -l`
katalogi=`find linux -type d | wc -l`
asm=`find linux -name "*.asm" | wc -l`
cpp=`find linux -name "*.cpp" | wc -l`
c=`find linux -name "*.c" | wc -l`
miesiac=`find linux -mtime -30 | wc -l`
rok=`find linux -mtime -365 | wc -l`
dekada=`find linux -mtime -3650 | wc -l`
echo Jest $pliki plikow
echo Jest $katalogi katalogow
echo Z $pliki plikow $asm ma rozszerzenie asm, $c c, a $cpp cpp
echo Jest $miesiac plikow zmodyfikowanych w ostatnim miesiacu, $rok w ostatnim roku, $dekada w ostatniej dekadzie
