#!/bin/bash

cp _drafts/dgxvolume.template index.html
cd dgxvolume_scripts 
python3 wv.py > intro.txt
awk -vORS=, '{ print "\""$1"\"" }' 86400.dat | sed 's/,$/\n/' > date.list
awk -vORS=, '{ print $4/1e9 }' 86400.dat | sed 's/,$/\n/' > ts.dat
awk -vORS=, '{ print $5/1e9 }' 86400.dat | sed 's/,$/\n/' > fees.dat
A=$(cat date.txt)
B=$(cat date.list)
C=$(cat ts.dat)
D=$(cat fees.dat)
cd -
sed -i "s/DATE/$A/" index.html
sed -i "s/XRANGE/$B/" index.html
sed -i "s/YRANGE/$C/" index.html
sed -i "s/FEERANGE/$D/" index.html
#git add .
#git commit -m "."
#git push -u origin master

