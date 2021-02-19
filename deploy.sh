. ./config
. ./install-package.sh
. ./create_archive.sh
. ./database.sh

echo "$SSH_USER"
HELP_INFO="
DEPLOYMAN\n
	Аргументы: \n
		-b --backup - делаем бэкап БД \n
		-f --file - указываем путь к файлу \n
		-v --verbose - мод показа информациия \n
"

while :; do
	case $1 in
		--file|-f)
			file=$2
			shift
			echo $file
			;;
		--backup|-b) 
			db_name=$2
			db_file=$3
			create_backup $db_name $db_file
			shift
			shift
			;;
		--create-archive|-c)
			name=$2
			path=$3
			create_archive $name $path
			shift
			shift
			break
			;;
		?|-h|--help)
			echo -e "$HELP_INFO"
			break
			;;
		*) 
			echo "fuck you"
			break
			;;
	esac

	shift
done
