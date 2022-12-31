#!/bin/bash

# print fnction with color and newline/sameline options
# nl: NewLine/ nnl: No NewLine
function print(){
	local c_code=0
	# color c_code chck
	if [ "$1" == "red" ]; then c_code="31m" 
	elif [ "$1" == "yellow" ]; then c_code="33m" 
	elif [ "$1" == "green" ]; then c_code="32m" 
	elif [ "$1" == "cyan" ]; then c_code="36m" 
	elif [ "$1" == "purple" ]; then c_code="35m"
	#white output(Default)
	else c_code="37m" 
	fi
	# combine c_code with printed line(string combination)
	c_code+="$2"
	# new line or not
	# 'echo -e' enables color hex code identification 
	if [ "$3" == "nl" ]; then echo -e  "\e[1;${c_code}\e[0m"
	# '-n' parameter means no newline
	else echo -n -e "\e[1;${c_code} \e[0m"
	fi
	return 
}

print "yellow" "test line" "nl"
print "cyan" "urbao:" "nnl"
sleep 5
