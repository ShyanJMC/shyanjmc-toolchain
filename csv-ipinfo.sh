#!/bin/bash

# Copyright; ShyanJMC <joaquincrespo96@gmail.com> <shyanjmc@protonmail.com> <shyan@shyanjmc.com>
# Year; 2022
# LICENSE; GPL <https://www.gnu.org/licenses/gpl-3.0.html>

# $1 = First argument = The CSV File with IPs separated with comas and newlines
# $2 = The country to filter with "country" field
#	https://www.uptodate.com/contents/image?imageKey=DRUG%2F116421 

#	Country abbreviations used in Brand Names: International field of Lexicomp monographs
#	Argentina (AR) 	Honduras (HN) 	Peru (PE)
#	Australia (AU) 	Hong Kong (HK) 	Philippines (PH)
#	Austria (AT) 	Hungary (HU) 	Poland (PL)
#	Bahamas (BS) 	Iceland (IS) 	Portugal (PT)
#	Bahrain (BH) 	India (IN) 	Puerto Rico (PR)
#	Bangladesh (BD) 	Indonesia (ID) 	Qatar (QA)
#	Barbados (BB) 	Iran (IR) 	Republic of Korea (KR)
#	Belgium (BE) 	Iraq (IQ) 	Romania (RO)
#	Belize (BZ) 	Ireland (IE) 	Russian Federation (RU)
#	Benin (BJ) 	Israel (IL) 	Saudi Arabia (SA)
#	Bermuda (BM) 	Italy (IT) 	Senegal (SN)
#	Bolivia (BO) 	Jamaica (JM) 	Seychelles (SC)
#	Brazil (BR) 	Japan (JP) 	Sierra Leone (SL)
#	Bulgaria (BG) 	Jordan (JO) 	Singapore (SG)
#	Burkina Faso (BF) 	Kenya (KE) 	Slovakia (SK)
#	Chile (CL) 	Kuwait (KW) 	Slovenia (SI)
#	China (CN) 	Latvia (LV) 	South Africa (ZA)
#	Colombia (CO) 	Lebanon (LB) 	Spain (ES)
#	Costa Rica (CR) 	Liberia (LR) 	Sri Lanka (LK)
#	Côte D' Ivoire (CI) 	Libya (LY) 	Sudan (SD)
#	Croatia (HR) 	Liechtenstein (LI) 	Surinam (SR)
#	Cuba (CU) 	Lithuania (LT) 	Sweden (SE)
#	Cyprus (CY) 	Luxembourg (LU) 	Switzerland (CH)
#	Czech Republic (CZ) 	Malawi (MW) 	Syria (SY)
#	Denmark (DK) 	Malaysia (MY) 	Syrian Arab Republic (SY)
#	Dominican Republic (DO) 	Mali (ML) 	Taiwan, Province of China (TW)
#	Ecuador (EC) 	Malta (MT) 	Tanzania (TZ)
#	Egypt (EG) 	Mauritania (MR) 	Thailand (TH)
#	El Salvador (SV) 	Mauritius (MU) 	Trinidad and Tobago (TT)
#	Estonia (EE) 	Mexico (MX) 	Tunisia (TN)
#	Ethiopia (ET) 	Morocco (MA) 	Turkey (TR)
#	Finland (FI) 	Netherlands (NL) 	Uganda (UG)
#	France (FR) 	New Zealand (NZ) 	Ukraine (UA)
#	Gambia (GM) 	Nicaragua (NI) 	United Arab Emirates (AE)
#	Germany (DE) 	Niger (NE) 	Uruguay (UY)
#	Ghana (GH) 	Nigeria (NG) 	Venezuela (VE)
#	Great Britain [UK] (GB) 	Norway (NO) 	Vietnam (VN)
#	Greece (GR) 	Oman (OM) 	Yemen (YE)
#	Guatemala (GT) 	Pakistan (PK) 	Zambia (ZM)
#	Guinea (GN) 	Panama (PA) 	Zimbabwe (ZW)
#	Guyana (GY) 	Paraguay (PY)


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
