# fish-bd

[![Join the chat at https://gitter.im/0rax/fish-bd](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/0rax/fish-bd?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

**Quickly go back to a parent directory up in your current working directory tree.**
**Don't write 'cd ../../..' redundantly, use bd instead.**

This is a fish implementation of [vigneshwaranr/bd](https://github.com/vigneshwaranr/bd) by Vigneshwaran Raveendran

## Usage
```
# fish-bd v1.3.2 (https://github.com/0rax/bd-fish)

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
    and still match it
```

## Installation
#### Using [Fisher](https://github.com/jorgebucaran/fisher) (recommended method)
```
# This method allows you to update bd automatically via `fisher`
fisher add 0rax/fish-bd
```

#### Using Symlinks
```
# This method allows you to update narwhal by just doing a 'git pull'
git clone https://github.com/0rax/fish-bd ~/.config/fish/fish-bd
mkdir -p ~/.config/fish/functions/ ~/.config/fish/completions/
ln -s ~/.config/fish/fish-bd/functions/bd.fish   ~/.config/fish/functions/
ln -s ~/.config/fish/fish-bd/completions/bd.fish ~/.config/fish/completions/
```

#### Using Make
```
make install # Assumes your fish config directory is '~/.config/fish'
```

#### Manual Install
```
set -l FISH_CONFIG_FOLDER ~/.config/fish/
cp functions/bd.fish   $FISH_CONFIG_FOLDER/functions/
cp completions/bd.fish $FISH_CONFIG_FOLDER/completions/
```

## License

fish-bd is MIT licensed. See [LICENSE](LICENSE).
