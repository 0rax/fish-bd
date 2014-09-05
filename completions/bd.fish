#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-

#completion for bd
complete -c bd -s c --description "Classic mode : goes back to the first directory named as the string (default)"
complete -c bd -s s --description "Seems mode : goes back to the first directory containing string"
complete -c bd -s i --description "Case insensitive move (implies seems mode)"
complete -c bd -l help -f -x --description "Display help and exit"
complete -c bd --authoritative -f

function __fish_bd_complete_dirs
	printf (pwd | sed 's|/|\\\n|g')
end

complete -c bd -a '(__fish_bd_complete_dirs)'
