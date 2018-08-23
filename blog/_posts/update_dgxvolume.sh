#!/bin/bash

cp dgxvolume.template dgxvolume.html
cd dgxvolume_scripts 
python3 wv.py >> ../dgxvolume.markdown
gnuplot graph_weekly.gp
gnuplot graph_daily.gp
gnuplot graph_fees.gp
./eps2png.sh out.eps
./eps2png.sh daily.eps
./eps2png.sh fees.eps
A=$(cat date.txt)
cd /home/thomas/bandityui.github.io/
sed -i "s/VALUE/$A/" dgxvolume.markdown
git add .
git commit -m "."
git push -u origin master

