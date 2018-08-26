#!/bin/bash

cp /home/thomas/bandityui.github.io/_drafts/dgxvolume.template /home/thomas/bandityui.github.io/index.html
cd /home/thomas/bandityui.github.io/dgxvolume_scripts 
python3 wv.py > intro.txt
awk -vORS=, '{ print "\""$1"\"" }' 86400.dat | sed 's/,$/\n/' > dailydate.list
awk -vORS=, '{ print "\""$1"\"" }' 604800.dat | sed 's/,$/\n/' > weeklydate.list
awk -vORS=, '{ print $4 }' 86400.dat | sed 's/,$/\n/' > ts.dat
awk -vORS=, '{ print $5 }' 86400.dat | sed 's/,$/\n/' > fees.dat
awk -vORS=, '{ print $6 }' 86400.dat | sed 's/,$/\n/' > tv.dat
awk -vORS=, '{ print $3 }' 86400.dat | sed 's/,$/\n/' > dv.dat
awk -vORS=, '{ print $3 }' 604800.dat | sed 's/,$/\n/' > wv.dat
CURRENTDATE=$(cat date.txt)
DAILYDATE=$(cat dailydate.list)
WEEKLYDATE=$(cat weeklydate.list)
TOTALSUPPLY=$(cat ts.dat)
FEES=$(cat fees.dat)
TOTALVOLUME=$(cat tv.dat)
DAILYVOLUME=$(cat dv.dat)
WEEKLYVOLUME=$(cat wv.dat)
cd /home/thomas/bandityui.github.io/
sed -i "s/CURRENTDATE/$CURRENTDATE/" index.html
sed -i "s/XRANGE/$DAILYDATE/" index.html
sed -i "s/YRANGE/$TOTALSUPPLY/" index.html
sed -i "s/FEERANGE/$FEES/" index.html
sed -i "s/TVRANGE/$TOTALVOLUME/" index.html
sed -i "s/DVRANGE/$DAILYVOLUME/" index.html
sed -i "s/WEEKLYDATE/$WEEKLYDATE/" index.html
sed -i "s/WVRANGE/$WEEKLYVOLUME/" index.html
grep -v 'title:' /home/thomas/bandityui.github.io/index.html > /home/thomas/bandityui.github.io/dgxvolume.html
git add .
git commit -m "."
git push -u origin master

