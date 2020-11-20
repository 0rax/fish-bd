#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# fisher-uninstaller for fish-bd
# https://github.com/0rax/bd-fish
#

function _bd_uninstall --on-event bd_uninstall
	functions -e __bd_usage
end
