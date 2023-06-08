#!/bin/bash

echo "Привет!" 
echo "Cколько знаешь городов России с населением более 1 млн. человек?"

city=16

echo -n "У тебя есть немного времени на подумать. Напиши свой вариант: "

if read -t 10 -n 4 guess                      #ограничение по времени 20 секунд, в переменную будет записано максимум 4 символа
echo -e "\n введено $guess"

then 
	while [[ $guess -ne $city ]]
	do
	if [[ $guess -lt $city ]]; then 
		if read -t 5 -n 4 -p "Городов больше, попробуй еще раз! " guess
			echo -e "\n введено $guess"
		then echo ""
		else
			echo "Не введено значение больше. Ты не ввел значение, пока!" 
			break
		fi	

	elif [[ $guess -gt $city && $guess -le 1118 ]]; then 
		if read -t 5 -n 4 -p "Слишком много, попробуй еще раз :) " guess
			echo -e "\n введено $guess"
		then echo ""
		else
			echo "Не введено значение в интервале. Ты не ввел значение, пока!" 
			break
		fi

	else 
		if read -t 5 -n 4 -p "Введи целое число до 1118, столько городов есть в РФ " guess
			echo -e "\n введено $guess"
		then 
			echo ""
		else
			echo -e "\nНе введено значение меньше 1118. Ты не ввел значение, пока!" 
			exit
		fi
	fi
	done
	echo "Все верно, по данным Википедии, на 2023г городов 16. Пока!"

else
	echo "Не введено первое значени. Ты не ввел значение, пока!" 
	exit

fi
