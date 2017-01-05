# fish-bd

[![Join the chat at https://gitter.im/0rax/fish-bd](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/0rax/fish-bd?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

**Quickly go back to a parent directory up in your current working directory tree.**
**Don't write 'cd ../../..' redundantly, use bd instead.**

This is a fish implementation of [vigneshwaranr/bd](https://github.com/vigneshwaranr/bd) by Vigneshwaran Raveendran

## Usage
```
# fish-bd v1.3.0 (https://github.com/0rax/bd-fish)

Description:
    Quickly go back to a parent directory up in your current working directory tree.
    Don't write 'cd ../../..' redundantly, use bd instead.

Usage:
    bd [option] <directory name>

Examples:
    # You are in /home/user/my/path/is/very/long/
    # And you want to go back to 'path', simple type
    > bd path
    # or
    > bd -s pa
    # or
    > bd -i P
    # And you are now in /home/user/my/path/

Options:
    -c      Classic mode : goes back to the first directory named as the string (default)
            Set if default using (set -gx BD_OPT 'classic')
            Default mode when BD_OPT or CLI options are specified
    -s      Seems mode : goes back to the first directory containing string
            Set it as default using (set -gx BD_OPT 'sensitive')
    -i      case insensitive move (implies seems mode)
            Set it as default using (set -gx BD_OPT 'insensitive')
    -h      Print this help and exit
```

## Installation
#### Using Fisherman (recommended method)
```
# This method allows you to update bd automatically via `fisher update`
fisher install 0rax/fish-bd
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
