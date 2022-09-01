#!/usr/bin/env bash

#This is a bash list/array
declare -a array=($(ls))

## now loop through the above array
for i in "${array[@]}"
do
  echo "This ${i} is delicious!" && wc -l ${i}
done
