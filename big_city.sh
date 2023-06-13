#!/bin/bash

echo "Привет!" 
echo "Cколько знаешь городов России с населением более 1 млн. человек?"

city=16
all_city=1118

function numberNotAdded () {
					echo -e "\nТы не ввел число, пока!" 
					exit
}

echo -n "У тебя есть немного времени на подумать. Напиши свой вариант: "

if read -t 20 -n 4 guess; then
	function checkNumber () {
		while ! [[ "$guess" =~ ^[0-9]+$ ]]
		do
			if read -t 10 -n 4 -p " Нужно ввести целое число больше 0! " guess
			then echo ""
			else
				numberNotAdded
			fi
		done
	}
	checkNumber
	while [[ $guess -ne $city ]]
	do
		if [[ $guess -lt $city ]]; then 
			if read -t 10 -n 4 -p " Городов больше, попробуй еще раз! " guess
			then checkNumber
			else
				numberNotAdded
			fi	
		elif [[ $guess -gt $city && $guess -le $all_city ]]; then 
			if read -t 10 -n 4 -p " Слишком много, попробуй еще раз :) " guess
			then checkNumber
			else
				numberNotAdded
			fi
		else 
			if read -t 10 -n 4 -p " Введи целое число до $all_city, столько городов есть в РФ " guess
			then 
				checkNumber
			else
				numberNotAdded
			fi
		fi
	done
	echo "Все верно, по данным Википедии, на 2023г городов 16. Пока!"
else
	numberNotAdded
fi
