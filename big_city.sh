#!/bin/bash

city=16
all_city=1118

function numberNotAdded () {
	echo -e "\nТы не ввел число, пока!" 
	exit
}

time=20

echo "Привет!" 
echo "Cколько знаешь городов России с населением более 1 млн. человек?"
echo -n "У тебя есть немного времени на подумать. Напиши свой вариант: "

while true; do
	if read -t $time -n 4 guess; then
		time=10
		if ! [[ $guess =~ ^[0-9]+$ ]]; then
			echo "  Нужно ввести целое число больше 0! "
			continue
		fi
		
		if [[ $[10#$guess] -eq $city ]]; then 
			echo "  Все верно, по данным Википедии, на 2023г городов 16. Пока!"
			exit
		fi

		if [[ $[10#$guess] -lt $city ]]; then 
			echo "  Городов больше, попробуй еще раз!"
			continue
		fi

		if [[ $[10#$guess] -gt $city && $[10#$guess] -le $all_city ]]; then 
			echo "  Слишком много, попробуй еще раз :)"
			continue
		fi

		if [[ $[10#$guess] -gt $all_city ]]; then 
			echo "  Введи целое число до $all_city, столько городов есть в РФ "
			continue
		fi
		
	else
		numberNotAdded
	fi
done
