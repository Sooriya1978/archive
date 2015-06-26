#!/bin/bash

for i in $(ls output|grep csv) ; 
do 
  cat output/$i >> output/todas.csv; 
  echo " " >> output/todas.csv;  
done
