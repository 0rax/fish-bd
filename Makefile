FISH_CONFIG_PATH ?= ${HOME}/.config/fish

all:

install:

	install -d ${FISH_CONFIG_PATH}/functions
	install functions/bd.fish ${FISH_CONFIG_PATH}/functions

	install -d ${FISH_CONFIG_PATH}/completions
	install completions/bd.fish ${FISH_CONFIG_PATH}/completions

uninstall:

	rm -f ${FISH_CONFIG_PATH}/functions/bd.fish
	rm -f ${FISH_CONFIG_PATH}/completions/bd.fish

.PHONY: all install uninstall
