#!/bin/bash

config_menu () {
		. $realPath/hello.sh
		result=""
		MENU="
		Выберите нужный пункт:\n
			1. Выставить путь к проекту \n
			2. Доступы к базу данных \n
			3. Доступы ssh для подключения \n
			9. Назад \n
			0. Выход \n
		"

		echo -e $MENU

		doing=$( input )
		case $doing in
			1) $cls; result=set_path; main_menu ;;
			2) $cls; echo 2 ;;
			9) $cls; main_menu ;;
			0) $cls; exit 0 ;; 
		esac
}
