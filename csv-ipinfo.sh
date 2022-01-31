#!/bin/bash

# Copyright; ShyanJMC <joaquincrespo96@gmail.com> <shyanjmc@protonmail.com> <shyan@shyanjmc.com>
# Year; 2022
# LICENSE; GPL <https://www.gnu.org/licenses/gpl-3.0.html>

# $1 = First argument = The CSV File with IPs separated with comas and newlines

while read ip
do
	# Print the IP
	echo && echo $ip
	# Send the IP without CIDR to ipinfo.io to get information
	# 0 trim the whitespaces and tabulations with sed. The syntax is;
	#	[ ] is space and in combination with "*" will means; as many spaces
	# 1 clean the double quotas
	# 2 clean the range CIDR
	# 3 separate 
	echo $ip | sed 's/[ ]*//g' | sed 's/"//g' | sed 's/\/[0-9][0-9]//g' | cut -f1 -d',' | xargs -I{} curl -s ipinfo.io/{}
	
done < $1
