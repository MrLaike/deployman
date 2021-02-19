
neededPackages='tar sshpass gzip '

if [ -x "$(command -v apt)" ];		then sudo apt-get update -y && sudo apt-get install $neededPackages
elif [ -x "$(command -v pacman)" ];	then sudo pacman -Suy --no-confirm && sudo pacman -S $neededPackages
elif [ -x "$(command -v yum)" ];	then sudo yum upgrade && sudo yum install $neededPackages
elif [ -x "$(command -v dnf)" ];	then sudo dnf upgrade && sudo dnf install $neededPackages
else echo "Пакетный менеджер не найден"
fi



