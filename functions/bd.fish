#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# fish-bd main & usage function
# https://github.com/0rax/bd-fish
#

function bd

    set -l oldpwd (pwd)
    set -l newpwd ""
    set -l opts   "$BD_OPT"
    set -l args   (getopt "csih" $argv)

    if [ $status -gt 0 ]
        return 1
    end
    set args (echo $args | sed 's/^\s//' | tr ' ' '\n')

    set -l i 1
    for arg in $args
        switch $arg
        case "-h"
            printf "# fish-bd v1.3.3 (https://github.com/0rax/bd-fish)

Description:
    Quickly go back to a parent directory up in your current working directory tree.
    Don't write 'cd ../../..' redundantly, use bd instead.

Usage:
    bd [option] <pattern>

Examples:
    # You are in /home/user/my/path/is/very/long/
    # And you want to go back to 'path', simple type
    > bd path
    # or
    > bd -s pa
    # or
    > bd -i Pat
    # And you are now in /home/user/my/path/

Options:
    -c <pattern>
            Classic mode : goes back to the first directory matching the pattern (default)
            Set if default using (set -gx BD_OPT 'classic')
            Default mode when BD_OPT or CLI options are specified
    -s <pattern>
            Seems mode: goes back to the first directory starting with pattern
            Set it as default using (set -gx BD_OPT 'sensitive')
    -i <pattern>
            Case insensitive mode: same as seems mode without case sensitity
            Set it as default using (set -gx BD_OPT 'insensitive')
    -h      Print this help and exit

Note:
    Fuzzy matching of a directory can be done with any mode using the built-in
    fish-shell autocompletion. This allows you to enter any part of the path
    and still match it.\n"
            return 0
        case "-s"
            set opts "sensitive"
        case "-i"
            set opts "insensitive"
        case "-c"
            set opts "classic"
        case "--"
            set i (math $i + 1)
            break
        end
        set i (math $i + 1)
    end

    if [ $i -gt (count $args) ]
        cd ..
        pwd
        return 0
    end

    switch "$opts"
    case "sensitive"
        set newpwd (echo $oldpwd | sed 's|\(.*/'$args[$i]'[^/]*/\).*|\1|')
    case "insensitive"
        set newpwd (echo $oldpwd | perl -pe 's|(.*/'$args[$i]'[^/]*/).*|$1|i')
    case '*' # classic
        set newpwd (echo $oldpwd | sed 's|\(.*/'$args[$i]'/\).*|\1|')
    end

    if [ "$newpwd" = "$oldpwd" ]
        echo "No such occurence." >&2
    else
        echo "$newpwd"
        cd   "$newpwd"
    end

end
