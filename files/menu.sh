#!/bin/bash

file_menu () {
		. $realPath/hello.sh
		MENU="
		Выберите нужный пункт: \n
			1. Заархивировать проект \n
			2. Распаковать проект \n
			3. Скачать и развернуть проект(ssh)\n
			9. Назад \n
			0. Выход \n
		"
		echo -e $MENU

		doing=$( input )
		case $doing in
			1) $cls; create_archive ;;
			2) $cls; extract_archive ;;
			3) $cls; deploy ;;
			9) $cls; main_menu ;;
			0) $cls; exit 0 ;;
			*) $cls; file_menu ;;
		esac
		main_menu
}
