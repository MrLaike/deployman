#!/bin/bash

realPath="`dirname $( readlink -f $0 )`"
. $realPath/head.sh

$cls

main_menu () {
		. $realPath/hello.sh

		MENU="
		Выберите нужный пункт:\n
			1. База данных \n
			2. Файлы проекта \n
			0. Выход \n
		"

		if [ -n "$result" ]; then echo -e "$GREEN$result$NC"; fi

		echo -e $MENU

		doing=$( input )
		case $doing in
			1) $cls; db_menu ;;
			2) $cls; file_menu ;;
		  # 3) $cls; config_menu ;;
			0) $cls; exit 0 ;;
			*) $cls; main_menu ;;
		esac
}

main_menu
