#!/bin/bash

cp _drafts/dgxvolume.template dgxvolume.html
cd dgxvolume_scripts 
python3 wv.py >> ../dgxvolume.html
A=$(cat date.txt)
cd -
sed -i "s/DATE/$A/" dgxvolume.html
git add .
git commit -m "."
git push -u origin master

