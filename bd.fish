#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# fish-bd 1.0 by Jean-Philippe Roemer <roemer.jp@gmail.com>
# https://github.com/0rax/bd-fish
#

function __bd_usage
    printf "# fish-bd 1.0 by Jean-Philippe Roemer <roemer.jp@gmail.com>
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
    -c\t\tClassic mode : goes back to the first directory named as the string
	\t\tSet if default using (set -gx BD_OPT 'classic')
	\t\tDefault mode when BD_OPT or CLI options are specified
    -s\t\tSeems mode : goes back to the first directory containing string
    \t\tSet it as default using (set -gx BD_OPT 'sensitive')
    -i\t\tCase insensitive move (implies seems mode)
    \t\tSet it as default using (set -gx BD_OPT 'insensitive')    
    --help\t\tDisplay this help text

    Option must be unique and the first argument due to shell limitation.
    Except for -si/-is for compatibility with the bash version.\n"
end

function bd

    set -l __bd_oldpwd (pwd)
    set -l __bd_newpwd
    set -l __bd_index
    set -l __bd_arg
    set -l __bd_opts $BD_OPT

    switch "$argv[1]"
    case "[1]"
        echo "No argument."
        __bd_usage
        return 1
    case "-s"
        if test "$argv[1]" = "$argv[-1]"
            echo "No argument."
            __bd_usage
            return 1
        else
            set __bd_opts "sensitive"
            set __bd_arg $argv[2]
        end
    case "-i"
        if test "$argv[1]" = "$argv[-1]"
            echo "No argument."
            __bd_usage
            return 1
        else
            set __bd_opts "insensitive"
            set __bd_arg $argv[2]
        end
    case "-si"
        if test "$argv[1]" = "$argv[-1]"
            echo "No argument."
            __bd_usage
            return 1
        else
            set __bd_opts "insensitive"
            set __bd_arg $argv[2]
        end
	case "-c"
        if test "$argv[1]" = "$argv[-1]"
            echo "No argument."
            __bd_usage
            return 1
        else
            set __bd_opts "classic"
            set __bd_arg $argv[2]
        end
	case "-ci"
        if test "$argv[1]" = "$argv[-1]"
            echo "No argument."
            __bd_usage
            return 1
        else
            set __bd_opts "insensitive"
            set __bd_arg $argv[2]
        end
    case '--help'
        __bd_usage
        return 0
    case '*'
		set __bd_opts "classic"
        set __bd_arg $argv[1]
    end

    switch "$__bd_opts"
    case "sensitive"
        set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$__bd_arg'[^/]*/\).*|\1|')
        set __bd_index  (echo $__bd_newpwd | awk '{ print index($0,"/'$__bd_arg'"); }')
    case "insensitive"
        set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$__bd_arg'[^/]*/\).*|\1|I')
        set __bd_index  (echo $__bd_newpwd | awk '{ print index(tolower($0),tolower("/'$__bd_arg'")); }')
    case 'classic'
        set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$__bd_arg'/\).*|\1|')
        set __bd_index  (echo $__bd_newpwd | awk '{ print index($1,"/'$__bd_arg'/"); }')    
    end

    if test $__bd_index = 0
        echo "No such occurence."
    end
    
    echo "$__bd_newpwd"
    cd "$__bd_newpwd"

end
