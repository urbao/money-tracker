#!/bin/bash

# global var(allowed to changed base on ur pref.)
#-------------------------------------------#
usrname="urbao"
dirloca="$HOME/Desktop/money tracker"
logfile="$HOME/Desktop/money tracker/log.txt"
helpfile="$HOME/Desktop/money tracker/help.txt"
#-------------------------------------------#

#--------------Side Functions---------------#
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
	if [ "$3" == "nl" ]
	then 
		echo -e  "\e[1;${c_code}\e[0m"
	# '-n' parameter means no newline
	else 
		echo -n -e "\e[1;${c_code} \e[0m"
	fi
	return 0
}

# backup log.txt with git, and push to GitHub
# Used after any modification with log.txt file
function gitpush(){
	cd "$dirloca" || return
	print "cyan" "---- git add ----" "nl"
	git add log.txt
	print "cyan" "--- git commit ---" "nl"
	git commit -m "update log file ($(date))"
	print "cyan" "---- git push ----" "nl"
	git push
	print "cyan" "------------------\n" "nl"
	return 0
}

# format line with space for prettier storage in log.txt
# parameter order(represent LENGTH of STRING): Date|Type|Amount|Detail|
function format_appd(){
	space1=$(printf '%*s' $((10-"${#2}")) ' ')
	space2=$(printf '%*s' $((7-"${#3}")) ' ')
	space3=$(printf '%*s' $((50-"${#4}")) ' ')
	update_time=$(date "+%a %b %d %T %G")
	result="$1$space1$2$space2$3  $4$space3$update_time"
	echo "$result" >> "$logfile"
	return 0
}
#-------------------------------------------#

#--------------Main Command-----------------#
# show function that show all contents of log.txt
function show(){
	while IFS= read -r line
	do
	  # colored different lines by their differnet types, using substr to check
	  if [[ $line == *"income"* ]]
	  then
	  	print "green" "$line" "nl"
	  elif [[ $line == *"expense"* ]]
	  then
	  	print "red" "$line" "nl"
	  else 
	  	print "yellow" "$line" "nl"
	  fi
	done < "$logfile"
	printf "\n"
	return 0
}

# help func that shows all valid options(help function)
function help(){
	while IFS= read -r line
		do echo "$line"
	done < "$helpfile"
	echo
	return 0
}

# append function that append latest info to log.txt
function append(){
	print "yellow" "------ Append ------" "nl"
	print "purple" "Date:" "nnl"
	read -r dat
	print "purple" "Type:" "nnl"
	read -r type
	print "purple" "Amount:" "nnl"
	read -r amount
	print "purple" "Detail:" "nnl"
	read -r detail
	# make sure before appending
	while true
	do
	   	print "red" "Do you want to append this?[Y/n]" "nnl"
		read -r ans
		if [ "${ans,,}" == "y" ]
		then
			chmod 777 "$logfile"
			format_appd "$dat" "$type" "$amount" "$detail"
			# append line to log file
			print "yellow" "------- Done -------" "nl"
			# backup with gitpush func
            chmod 444 "$logfile"
			gitpush
			return 0
		elif [ "${ans,,}" == "n" ]
		then
			print "yellow" "------ Cancel ------" "nl"
			return 0
		else
			print "red" "Error: invalid input\n" "nl"	
		fi
	done
}

# total func that print out all summary info
function total(){
	income=0, expense=0, income_count=0, expense_count=0
	while IFS=' '  read -ra line 
	do
		for idx in "${!line[@]}";
		do
			if [ "${line[idx]}" == "income" ]
			then 
				income=$(("$income"+"${line[idx+1]}"))
				income_count=$(("$income_count"+1))
			elif [ "${line[idx]}" == "expense" ]
			then 
				expense=$(("$expense"+"${line[idx+1]}"))
				expense_count=$(("$expense_count"+1))
			fi
		done
	done < "$logfile"
	total_count=$(("$income_count"+"expense_count"))
	# find percentage
	income_per=$((100*"$income_count"/"$total_count"))
	expense_per=$((100-(100*"$income_count"/"$total_count")))
	print "yellow" "----- Total Summary -----" "nl"
	print "purple" "Income:" "nnl"
	print "green" "$income" "nnl"
	print "green" "\b($income_per%)" 'nl'
	print "purple" "Expense:" "nnl"
	print "red" "$expense" "nnl"
	print "red" "\b($expense_per%)" 'nl'
	print "purple" "Total:" "nnl"
	if [ "$income" -ge "$expense" ]; then print "green" $(("$income"-"$expense")) "nl"
	else print "red" $(("expense"-"income")) "nl"
	fi
	print "yellow" "-------------------------\n" "nl"
	return 0
}

# function of find, using built-in 'grep'
function finder(){
	result=$(grep --color=always -i "$1" "$logfile")
	if [ "$result" == "" ];
	then print "red" "No matched case found" "nl"
	else echo "${result}"
	fi
	echo
	return 0
}

#-------------------------------------------#


# main part fuction, keep working until `exit` command typed
while true
do
	print "purple" "${usrname}:" "nnl"
	IFS=" " read -r input option
	if [[ "$input" == "" ]] && [[ "$option" == "" ]];then continue
	elif [[ "$input" == "exit" ]] && [[ "$option" == "" ]]; then exit
	elif [[ "$input" == "clear" ]] && [[ "$option" == "" ]]; then clear
	elif [[ "$input" == "show" ]] && [[ "$option" == "" ]]; then show 
	elif [[ "$input" == "help" ]] && [[ "$option" == "" ]]; then help
	elif [[ "$input" == "append" ]] && [[ "$option" == "" ]]; then append
	elif [[ "$input" == "total" ]] && [[ "$option" == "" ]]; then total
	elif [[ "$input" == "find" ]] && [[ "$option" != "" ]]; then finder "$option"
	else print "red" "Error: Invalid command\n" "nl" 
	fi
done
