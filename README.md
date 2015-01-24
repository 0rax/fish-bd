fish-bd
=======

**Quickly go back to a parent directory up in your current working directory tree.**
**Don't write 'cd ../../..' redundantly, use bd instead.**

This is a fish implementation of [vigneshwaranr/bd](https://github.com/vigneshwaranr/bd) by Vigneshwaran Raveendran



Usage
-----

```
# fish-bd 1.0 by Jean-Philippe Roemer <roemer.jp@gmail.com>
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
    -c		Classic mode : goes back to the first directory named as the string
	    		Set it as default using (set -gx BD_OPT 'classic')
	    		Default mode when BD_OPT or CLI options are specified
    -s		Seems mode : goes back to the first directory containing string
    	    	Set it as default using (set -gx BD_OPT 'sensitive')
    -i		Case insensitive move (implies seems mode)
    	    	Set it as default using (set -gx BD_OPT 'insensitive')
    --help	Display this help text

    Option must be unique and the first argument due to shell limitation.
    Except for -si/-is for compatibility with the bash version.
```

Installation
------------

#### Using Make
Run `make install`. Assumes your fish config directory is `~/.config/fish`.

#### Manual Install
Copy `bd.fish` into the `/functions` directory off of your fish config root.
Copy `completions/bd.fish` into the `/completions` directory off of your fish
config root.


