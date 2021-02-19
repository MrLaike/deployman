#!/bin/bash

db_menu () {
		. $realPath/hello.sh

		result=""
		MENU="
		Выбeрите нужный пункт:\n
			1. Сделать бекап локальной бд\n
			2. Восстановить из бекапа \n
			3. Сделать бекап бд c удаленного сервера\n
			9. Назад \n
			0. Выход \n
		"

		echo -e $MENU

		doing=$( input )
		case $doing in
			1) $cls; create_backup ;;
			2) $cls; restore_backup ;;
			3) $cls; create_remote_backup ;;
			4) $cls; restore_remote_backup ;;
			9) $cls; main_menu ;;
			0) $cls; exit 0 ;;
			*) $cls; db_menu ;;
		esac
}
