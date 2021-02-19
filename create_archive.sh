create_archive () {
	path=$1
	local_path=$2
	if [ -z $local_path ]; then local_path="/tmp/file.tar.gz" fi
	return tar czvf - $path > $local_path
}

extract_archive () {
	path=$1
	extract_path=$2
	if [ -z $local_path ]; then extract_path="/tmp/file.tar.gz" fi
	tar xzvf $archive_name > $path
}

