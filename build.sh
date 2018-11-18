#!/bin/bash

echo Creating tmp and data folders
mkdir tmp
mkdir data

echo Downloading shapefile
echo SOURCE https://www.bfs.admin.ch/bfs/fr/home/services/geostat/geodonnees-statistique-federale/limites-administratives/limites-communales-generalisees.assetdetail.5247306.html
curl 'https://www.bfs.admin.ch/bfsstatic/dam/assets/5247306/master' -o tmp/communes.zip

echo Create data/communes_unzip folder
mkdir tmp/communes_unzip

echo -----
echo Unzip
unzip tmp/communes.zip -d tmp/communes_unzip

PATH_TO_SHP="tmp/communes_unzip/ggg_2018-LV95/shp"

echo Converting communes to geojson
node node_modules/.bin/shp2json \
  $PATH_TO_SHP/g1g18 \
  -o data/communes.json

echo Converting districts to geojson
node node_modules/.bin/shp2json \
  $PATH_TO_SHP/g1b18 \
  -o data/districts.json

echo Converting cantons to geojson
node node_modules/.bin/shp2json \
  $PATH_TO_SHP/g1k18 \
  -o data/cantons.json

echo Converting lakes to geojson
node node_modules/.bin/shp2json \
  $PATH_TO_SHP/g1s18 \
  -o data/lakes.json