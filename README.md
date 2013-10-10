fish-bd
=======

This is a fish implementation of [vigneshwaranr/bd](https://github.com/vigneshwaranr/bd) by Vigneshwaran Raveendran 

#### Quickly go back to a parent directory up in your current working directory tree. Don't write 'cd ../../..' redundantly, use bd insteand.

---

**Usage**

```
fish-bd 1.0 by Jean-Philippe Roemer <roemer.jp@gmail.com>
https://github.com/0rax/bd-fish

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
    > bd -si P
    # And you are now in /home/user/my/path/
Options:
    -s      Seems mode : goes back to the first directory containing string
            Set it as default using (set -gx BD_OPT 'sensitive')
    -si     Case insensitive move (implies seems mode)
            Set it as default using (set -gx BD_OPT 'insensitive')    
    -h      Display this help text"
```

---

**Todo**
1. Autocompletion
2. Reproducing the `bd foo` mechanisme using (bd foo)
3. Add How-To-Install and Usage in README.md
