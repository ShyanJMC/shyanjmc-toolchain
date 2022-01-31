#!/bin/bash

while read range
do
	echo && echo $range
	echo $range | sed 's/[ ]*//g' | sed 's/"//g' | cut -f1 -d',' | xargs -I{} curl -s https://networkcalc.com/api/ip/{} | jq .[]
done < $1
