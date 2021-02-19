#!/bin/bash
create_backup () {
	echo -e "$BOLDСоздание бeкапа$NC";
	db_name=$( input "имя базы данных" )
	db_file=$( input "имя дамп файла" )

	case $DB_TYPE in
		"mysql")
			db_user=$( input "имя пользователя" )
			if mysqldump -u $db_user -p $db_name > "$db_file.sql"; then echo -e "$GREENБекап успешно создан$NC"
			else echo -e "$REDОшибка!!$NC"; fi
			;;
		"postgre")
			if pg_dump $db_name > "$db_file.sql"; then echo "Бекап успешно создан"
			else echo -e "$REDОшибка!!$NC"; fi
			;;
	esac

	wait
}

create_remote_backup () {
	echo -e "$BOLDСоздание бeкапа по ssh$NC";
	db_file=$( input "имя дамп файла" )
	db_name=$( input "имя базы данных" )

	case $DB_TYPE in
		"mysql")
			db_user=$( input "имя пользователя" )
			echo $SSH_PASSWORD
			if sshpass -p $SSH_PASSWORD ssh $SSH_USER@$SSH_HOST "mysqldump -u $db_user -p $db_name" > "$db_file.sql"; then echo ""
			else echo -e "$REDОшибка!!$NC"; fi
			;;
		"postgre")
			if sshpass -p $SSH_PASSWORD ssh $SSH_USER@$SSH_HOST "pg_dump $db_name | gzip -9" > "$db_file.sql"; then echo ""
			else echo -e "$REDОшибка!!$NC"; fi
			;;
	esac

	wait
}

restore_backup () {
	echo -e "$BOLDВосстановление из бекапов$NC";
	db_name=$( input "имя базы данных" )
	db_file=$( input "имя дамп файла" )

	case $DB_TYPE in
		"mysql")
			db_user=$( input "имя пользователя" )
			if mysql -u $db_user -p $db_name < "$db_file.sql"; then echo "Бекап успешно восстановлен"
			else echo -e "$REDОшибка!!$NC"; fi
			;;
		"postgre")
			if psql --set ON_ERROR_STOP=on $db_name < "$db_file.sql"; then echo "Бекап успешно восстановлен"
			else echo -e "$REDОшибка!!$NC"; fi
			;;
	esac

	wait
}
