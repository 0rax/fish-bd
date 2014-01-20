install:
	install -d ~/.config/fish/functions
	install bd.fish ~/.config/fish/functions
	install -d ~/.config/fish/completions
	install completions/bd.fish ~/.config/fish/completions

uninstall:
	rm -f ~/.config/fish/functions/bd.fish
	rm -f ~/.config/fish/completions/bd.fish
