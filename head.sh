#!/bin/bash

cls='printf \033c'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
BOLD='\033[1m'

. $realPath/files/menu.sh
. $realPath/configs/menu.sh
. $realPath/db/menu.sh


. $realPath/configs/config.sh
. $realPath/db/database.sh
. $realPath/files/archiver.sh

input () {
	if [ -z "$1" ]; then text="Введите значение: "
	else text="Введите $1: "; fi

	while read -rp "$text" value; do
		if [ -z "$value" ]
		then
			echo "Вы ничего не ввели!"
			printf "Введите значение: "
		else
			break
		fi
	done
	echo $value
}

wait () {
	echo -e "\nЧтоб продолжить нажмите любую кнопку...\n"
	while [ true ] ; do
		read -n 1
		if [ $? = 0 ] ; then $cls; main_menu; fi
	done
}
