create_archive () {
	archive_name="$( input "имя архива" ).tar.gz"
	path=$( input "путь до проекта" )

	if tar -czvf $archive_name $path
	then
		echo "Архив успешно создан"
	else
		echo "$REDОшибка!!!$NC"
	fi

	wait
}

create_remote_archive () {
	archive_name="$( input "имя архива" ).tar.gz"
	path=$( input "путь до проекта на удаленном сервере" )

	if sshpass -p $SSH_PASSWORD ssh $SSH_USER@SSH_HOST tar czvf - $path > $archive_name
	then
		echo "Архив успешно создан"
	else
		echo "$REDОшибка!!!$NC"
	fi

	wait
}

deploy () {
	archive_name="$( input "имя архива" ).tar.gz"
	remote_path=$( input "путь до проекта на удаленном сервере" )
	local_path=$( input "путь куда разархивировать проект" )

	echo $remote_path
	echo ${remote_path}
	if $( sshpass -p $SSH_PASSWORD ssh $SSH_USER@$SSH_HOST tar czvf - ${remote_path} > $archive_name )
	then
		echo -e "$GREENАрхив успешно создан и распакован$NC"
	else
		echo -e "$REDОшибка!!!$NC"
	fi
	$( tar -xzvf $archive_name -C $HOME$local_path )

	wait


}

extract_archive () {
	archive_name="$( input "имя архива" ).tar.gz"
	path=$( input "путь до проекта" )

	tar -xzvf $archive_name -C $path

	wait
}

