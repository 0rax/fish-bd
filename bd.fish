#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# fish-bd 1.1 by Jean-Philippe Roemer <roemer.jp@gmail.com>
# https://github.com/0rax/bd-fish
#

function __bd_usage
	printf "# fish-bd 1.1.1 by Jean-Philippe Roemer <roemer.jp@gmail.com>
# https://github.com/0rax/bd-fish

Based on bd for bash by Vigneshwaran Raveendran (https://github.com/vigneshwaranr/bd)

Description:
    Quickly go back to a parent directory up in your current working directory tree.
    Don't write 'cd ../../..' redundantly, use bd instead.

Usage:
    bd [option] <directory name>

Example:
    # You are in /home/user/my/path/is/very/long/
    # And you want to go back to 'path', simple type
    > bd path
    # or
    > bd -s pa
    # or
    > bd -i P
    # And you are now in /home/user/my/path/

Options:
    -c\t\tClassic mode : goes back to the first directory named as the string (default)
	\t\tSet if default using (set -gx BD_OPT 'classic')
	\t\tDefault mode when BD_OPT or CLI options are specified
    -s\t\tSeems mode : goes back to the first directory containing string
    \t\tSet it as default using (set -gx BD_OPT 'sensitive')
    -i\t\tCase insensitive move (implies seems mode)
    \t\tSet it as default using (set -gx BD_OPT 'insensitive')
    -h\t\tDisplay help and exit
"
end

function bd

	set -l __bd_oldpwd (pwd)
	set -l __bd_newpwd
	set -l __bd_index
	set -l __bd_arg
	set -l __bd_opts $BD_OPT

	set args (getopt "csih" $argv)
	if [ $status -gt 0 ]
        	return 1
	end
	set args (echo $args | sed 's/^\s//' | tr ' ' '\n')

	set -l i 1
	for arg in $args
		switch $arg
		case "-s"
			set __bd_opts "sensitive"
		case "-i"
			set __bd_opts "insensitive"
		case "-c"
			set __bd_opts "classic"
		case "--"
			set i (math $i + 1)
			break
		case "-h"
			__bd_usage
			return 0
		end
		set i (math $i + 1)
	end

	if [ $i -gt (count $args) ]
		cd ..
		pwd
		return 0
	end

	switch "$__bd_opts"
	case "sensitive"
		set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$args[$i]'[^/]*/\).*|\1|')
	case "insensitive"
		set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$args[$i]'[^/]*/\).*|\1|I')
	case '*'		# classic
		set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$args[$i]'/\).*|\1|')
	end

	if [ $__bd_newpwd = $__bd_oldpwd ]
		echo "No such occurence."
	end

	echo "$__bd_newpwd"
	cd "$__bd_newpwd"

end
