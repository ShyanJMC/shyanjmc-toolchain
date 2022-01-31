#!/bin/bash


# Copyright; ShyanJMC <joaquincrespo96@gmail.com> <shyanjmc@protonmail.com> <shyan@shyanjmc.com>
# Year; 2022
# LICENSE; GPL <https://www.gnu.org/licenses/gpl-3.0.html>


while read range
do
	echo && echo $range
	echo $range | sed 's/[ ]*//g' | sed 's/"//g' | cut -f1 -d',' | xargs -I{} curl -s https://networkcalc.com/api/ip/{} | jq .[]
done < $1
