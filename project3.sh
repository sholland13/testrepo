#!/bin/bash

file="./arrays_table.csv"

#parse table columns into three arrays
column_0=($(cut -d "," -f 1 $file))
column_1=($(cut -d "," -f 2 $file))
column_2=($(cut -d "," -f 3 $file))

#echo "${column_0[@]}"
column_3=("")
column_3[0]="column_3"

lines=$(cat $file | wc -l)

for ((i=1; i<$lines; i++)); do
    column_3[$i]=$((column_2[$i] - column_0[$i]))
done
echo "${column_3[@]}"

touch column_3.txt
echo -n "" > column_3.txt
for ((i=0; i<lines; i++)); do
    echo "${column_3[$i]}" >> column_3.txt
done
paste -d "," $file column_3.txt > combinedReport.csv

