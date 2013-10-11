install:
	install -t ${XDG_CONFIG_HOME}/fish/functions bd.fish
	install -t ${XDG_CONFIG_HOME}/fish/completions completions/bd.fish

uninstall:
	rm -f ${XDG_CONFIG_HOME}/fish/functions/bd.fish
	rm -f ${XDG_CONFIG_HOME}/fish/completions/bd.fish
